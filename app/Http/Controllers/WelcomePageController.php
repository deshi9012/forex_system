<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreWelcomePageRequest;
use App\Http\Requests\UpdateWelcomePageRequest;
use App\User;
use App\WelcomePage;
use Auth;
use Illuminate\Http\Request;

class WelcomePageController extends ApiController {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {


        $data['featured_welcome_pages'] = WelcomePage::where('is_featured', '=', true)->with('user.position')->get();

        $data['welcome_pages'] = WelcomePage::where('is_featured', '=', false)->with('user.position')->get();

//        if ($welcome_pages === null) {
//            dd('nqma featured');
            // user doesn't exist
//        }dd('ima featured');
        return $this->respond($data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
//    public function create() {
//        //
//    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreWelcomePageRequest $request) {

        $data = $request->all();
        if($data['is_featured']){
            WelcomePage::where('is_featured', '=', true)
                        ->update(['is_featured' =>false]);
        }

        $data['user_id'] = Auth::user()->id;

        WelcomePage::create($data);

        return $this->respondCreated();
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
//    public function show($id) {
//        //
//        $page = WelcomePage::with('user')->find($id);
//
//        return $this->respond($page);
//    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {

        $user = Auth::user();
        $page = WelcomePage::with('user')->find($id);

        if($user->can('welcome-page.update') || $user->can('welcome-page.edit')  || ($page->user_id == $user->id)){
            return $this->respond($page);
        }

        return $this->respondForbidden();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateWelcomePageRequest $request, $id) {
        $welcomePage = WelcomePage::find($id);

        $data = $request->all();

        if($data['is_featured']){
            WelcomePage::where('is_featured', '=', true)
                ->update(['is_featured' =>false]);
        }


        if (!$welcomePage) {
            return $this->respondNotFound();
        }

        $welcomePage->update([
            'short_message' => $request->input('short_message'),
            'long_message'  => $request->input('long_message')
        ]);

        return $this->respondWithSuccess();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $welcomePage = WelcomePage::find($id);
        if(!$welcomePage){
            return $this->respondNotFound();
        }
        $welcomePage->delete();
    }

    public function changeState($id) {

        $welcomePage = WelcomePage ::find($id);

        if($welcomePage->is_featured){
            $welcomePage->is_featured = false;
            $welcomePage->save();
        }

        WelcomePage::where('is_featured', '=', true)
            ->update(['is_featured' =>false]);


        $welcomePage->is_featured = true;
        $welcomePage->save();
        return $this->respondWithSuccess();
    }
}
