<?php

namespace App\Http\Controllers;

use App\SharedFile;
use App\User;
use Barryvdh\Elfinder\Connector;
use Barryvdh\Elfinder\Session\LaravelSession;
use elFinder;
use Exception;
use Illuminate\Filesystem\FilesystemAdapter;
use Illuminate\Http\Request;
use Cache;
use File;
use Intervention\Image\Facades\Image;
use Log;
use Storage;


class FileController extends ApiController {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
//    public function index(Request $request = NULL) {
//
//    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
//    public function create() {
//        //
//    }

    public function createDir(Request $request) {

        if($this->getStorage($request->get('storage'))){

            $storage = Storage::disk($request->get('storage'));
            $newFolderName = $request->get('newFolderName');
            $currentFolder = $request->get('currentFolder');

            $allowed = array('-', '_');

            if(!ctype_alnum(str_replace($allowed, '', $newFolderName))) {
                return $this->respondUnprocessableEntity('Invalid folder name');
            }

            //check if newFolderName exist in $currentFolder
            if(!$storage->exists($currentFolder.'/'.$newFolderName)){

                $storage->makeDirectory($currentFolder.'/'.$newFolderName);

                return $this->respondCreated('New Folder created');

            }
            return $this->respondUnprocessableEntity('This folder name already exists');

        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {

		//Remove additional //
	    $path = str_replace('/\/+/ig', '/', $request->path);

	    $storage = $this->getStorage($request->storage);

	    if($path != '/' && !Storage::disk($storage)->exists($path)) {
		    var_dump($storage);
		    dd($path);
		    return $this->respondInternalError();
	    }

	    if($request->hasFile('content') && $request->file('content')->isValid()) {

//		    Game::findOrFail($gameId);
//
//		    $photo = new Photo();
//		    $photo->game_id = $gameId;
//		    $photo->saveOrFail();
//
		    $file = $request->file('content');
		    $name = $request->file('content')->getClientOriginalName();

		    $result = Storage::disk($storage)->putFileAs($path, $file, $name);

		    if(!$result) {
			    dd('error');
		    }

//		    $url = Storage::disk('uploads')->url('/'. $folder .'/'. $photo->id . '.jpg');

		    return $this->respondCreated();
//		    return $this->setResponseData(['url' => $url])->respondCreated();
	    }

	    return $this->respondInternalError();
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
//    public function show(Request $request) {
//
//        dd($request);
//
//
//    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
//    public function edit($id) {
//        //
//    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
//    public function update(Request $request, $id) {
//        //
//    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id) {

	    $storage = $this->getStorage($request->storage);
//
	    if (!Storage::disk($storage)->delete($request->file)) {
		    return $this->respondInternalError();
	    }

	    return $this->respondWithSuccess();
    }

    public function moveFile(Request $request) {
        if($this->getStorage($request->get('storage'))){
            
            $storage = Storage::disk($request->get('storage'));
            $storage->move($request->get('file_path'), $request->get('url'));
            return $this->respondWithSuccess();
        }
        return $this->respondInternalError();
    }

    public function renameFolder(Request $request) {
        if($this->getStorage($request->get('storage'))) {

            $allowed = array('-', '_');

            $storage = $this->getStorage($request->storage);
            $oldName = $request->oldName;
            $newName = $request->corePath . $request->newName;

            if(!ctype_alnum(str_replace($allowed, '', $request->newName))) {
                return $this->respondUnprocessableEntity('Invalid folder name');
            }
            if(Storage::disk($storage)->has($request->corePath . $request->newName)){
                return $this->respondUnprocessableEntity('Invalid folder name');
            }

            Storage::disk($storage)->move($oldName,$newName);

            return $this->respondWithSuccess();
        }
    }

    public function deleteFolder(Request $request) {

        if($this->getStorage($request->get('storage'))){

            $storage = Storage::disk($request->get('storage'));

            $folderPath = $request->get('folder');

            //check if newFolderName exist in $currentFolder
            if($storage->exists($folderPath)){

                $storage->deleteDirectory($folderPath);
                return $this->respondCreated('Folder deleted');

            }

        }
    }

    //http://fxglobe.va/download?file=testdir\/1.png
    public function download(Request $request) {
        if (!$request->file) {
            return $this->respondNotFound();
        }

        $storage = $this->getStorage($request->disk);

        $file = $this->getFileInfo($request->file, $storage);

        $headers = ['Content-Type' => $file['mime']];

	    $storagePath = Storage::disk($storage)->getDriver()->getAdapter()->getPathPrefix();

        return response()->download($storagePath . $file['path'], $file['name'] . '.' . $file['extension'], $headers);
    }

	public function get(Request $request) {
		if (!$request->file && !$request->path) {
			return $this->respondNotFound();
		}

		$filePath = (!$request->file) ? $request->path : $request->file;

		$storage = $this->getStorage($request->disk);

		$file = $this->getFileInfo($filePath, $storage);

		$headers = ['Content-Type' => $file['mime']];

		$storagePath = Storage::disk($storage)->getDriver()->getAdapter()->getPathPrefix();

//		dd($storagePath . $file['path']);

		return response()->file($storagePath . $file['path']);
    }

    /**
     * @param $path
     *
     * @return bool
     */
    // FIX THIS POTENTIAL BUG!

    public function getFileInfo($path, $storage = 'uploads') {

        $cache_key = 'file_details-' . $path;

        if (!Storage::disk($storage)->exists($path)) {
            dd("storage/uploads/" . $path);
            return false;
        }

        if (Cache::has($cache_key)) {
            return Cache::get($cache_key);
        }


        $file_details['path'] = $path;
        $file_details['last_modified'] = Storage::disk($storage)->lastModified($path);
        $file_details['name'] = File::name($path);
        $file_details['extension'] = File::extension(storage_path() . $path);
        $file_details['mime'] = Storage::disk($storage)->mimeType($path);

        Cache::put($cache_key, $file_details, config('site.file_metadata_cache_store'));

        return $file_details;
    }

	public function getDirContents($folder = false, $storage = 'uploads') {
		$storage = $this->getStorage($storage);

		if (is_null($folder) || !$folder) {
			$folder = false;
		}

		$directories = Storage::disk($storage)->directories($folder);

		//$directories = array_diff($directories, ['.', '..']);

		//dd($folder);

		foreach ($directories as &$directory) {
			$path = $directory;
			$directory = [];
			$directory['path'] = $path;
			$directory['name'] = basename($path);
		}

		$result['currentPath'] = $folder;
		$result['directories'] = $directories;
		$result['files'] = Storage::disk($storage)->files($folder);

		foreach ($result['files'] as &$file) {
			//dd($this->getFileInfo($file));
			$file = $this->getFileInfo($file, $storage);
		}

		return $result;
    }

    public function downloadSharedFile(Request $request) {

        $file = SharedFile::where('short_code',$request->get('hash'))->first();
        $data = json_decode($file->data,true);

        $storage = $this->getStorage($data['disk']);
        $data['file_info'] = $this->getFileInfo($data['path'], $storage);

        $headers = ['Content-Type' => $data['file_info']['mime']];


        $storagePath = Storage::disk($storage)->getDriver()->getAdapter()->getPathPrefix();

        return response()->download($storagePath.$data['path'],'', $headers);

    }

    public function getPublicLink (Request $request) {
	    $publicURLs = [];

	    foreach ($request->links as $key => $file) {

		    $publicURLs[$key]['name']   = $file['name'];

		    $publicURLs[$key]['parse']    = parse_url($file['fullUrl']);

            parse_str($publicURLs[$key]['parse']['query'],$publicURLs[$key]['data']);

            $publicURLs[$key]['data'] = json_encode($publicURLs[$key]['data']);
            $publicURLs[$key]['short_code'] = base_convert(microtime(false), 10, 36);
            $publicURLs[$key]['url'] = env('APP_URL') . '/get/shared-file?hash=' . $publicURLs[$key]['short_code'];
            SharedFile::create([
                'data'          => $publicURLs[$key]['data'],
                'short_code'    => $publicURLs[$key]['short_code']
            ]);
	    }

		return $publicURLs;
    }

	public function userDocs(Request $request, $id) {
		$path = '/users/' . $id . '/' . $request->folder;
		return $this->respond($this->getDirContents($path));
    }

    public function storage(Request $request) {

	    $storage = $request->storage;
	    $path = $request->folder;

	    return $this->respond($this->getDirContents($path, $storage));
    }

	public function getStorage($storage = 'uploads') {

		try {
			Storage::disk($storage);
		} catch (Exception $e) {
			Log::error('Invalid Storage, setting to default.', $storage);
			$storage = 'uploads';
		}

		return $storage;
    }


    /**
     *
     * The following method replaces the default elFinder controller in order to implement partial Disk loading
     * and access management
     *
     */

	public function elFinderConnector(Request $request) {

		//var_dump($request->disks);

		$selectedDisks[] = $request->disks;

		if(!is_array($selectedDisks)) {
			dd($selectedDisks);
		}

		$this->app = app();

//		$roots = $this->app->config->get('elfinder.roots', []);
		if (empty($roots)) {
			$dirs = (array) $this->app['config']->get('elfinder.dir', []);
			foreach ($dirs as $dir) {
				$roots[] = [
					'driver' => 'LocalFileSystem', // driver for accessing file system (REQUIRED)
					'path' => public_path($dir), // path to files (REQUIRED)
					'URL' => url($dir), // URL to files (REQUIRED)
					'accessControl' => $this->app->config->get('elfinder.access'), // filter callback (OPTIONAL)
					'cache' => false
				];
			}

			$disks = (array) $this->app['config']->get('elfinder.disks', []);

//			var_dump($selectedDisks);

			foreach ($disks as $key => $value) {
				if(!in_array($key, $selectedDisks)){
					unset($disks[$key]);
				}
			}

			//dd($disks);

			foreach ($disks as $key => $root) {

				if (is_string($root)) {
					$key = $root;
					$root = [];
				}
				$disk = app('filesystem')->disk($key);

				if ($disk instanceof FilesystemAdapter) {

					$defaults = [
						'driver' => 'Flysystem',
						'filesystem' => $disk->getDriver(),
						'alias' => $key,
						'cache' => false
					];
					$roots[] = array_merge($defaults, $root);
				}
			}
		}

		if (app()->bound('session.store')) {
			$sessionStore = app('session.store');
			$session = new LaravelSession($sessionStore);
		} else {
			$session = null;
		}

		$rootOptions = $this->app->config->get('elfinder.root_options', array());
		foreach ($roots as $key => $root) {
			$roots[$key] = array_merge($rootOptions, $root);
		}

		$opts = $this->app->config->get('elfinder.options', array());
		$opts = array_merge($opts, ['roots' => $roots, 'session' => $session]);
//		$opts = array_merge($opts, ['roots' => $roots]);

		//dd($opts);

		// run elFinder
		$connector = new Connector(new \elFinder($opts));
		$connector->run();
		return $connector->getResponse();
    }

	public function uploadAvatar(Request $request) {
		//Save the file with name - ID.jpg

		//Create new storage for avatars
		//Resize to suqare

		if($request->hasFile('content') && $request->file('content')->isValid()) {

			$file = $request->file('content');
			$name = (int) $request->user_id . '.' . $request->file('content')->getClientOriginalExtension();


			$result = Storage::disk('public')->putFileAs('/avatars/', $file, $name);

            $data['path'] = Storage::disk('public')->url('avatars/'.$name);

            User::where('id',$request->user_id)->update(['avatar' => $request->user_id . '.jpg']);

			if(!$result) {
				dd('error');
			}

			//http://fxglobe.va/storage/avatars/1.jpg
//			$data['avatar_url'] = "/storage/avatars/"."1.jpg";
			return $this->respond($data);
		}

		return $this->respondInternalError();


    }
}