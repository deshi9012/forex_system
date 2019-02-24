<?php

namespace App\Http\Controllers;
use App\Http\Requests\UpdatePageRequest;
use App\Page;
use Illuminate\Http\Request;
use App\Http\Requests\StorePageRequest;

class PageController extends ApiController {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $pages = Page::all();
	    return $this->respond($pages);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(StorePageRequest $request) {
        Page::create($request->input());

	    return $this->respondCreated();
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $page = Page::find($id);

        if(!$page){
	        return $this->respondNotFound();
        }

	    return $this->respond($page);
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $page = Page::find($id);
        if(!$page){
	        return $this->respondNotFound();
        }

        return $this->respond($page);
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePageRequest $request, $id) {
        $page = Page::find($id);

        if(!$page){
	        return $this->respondNotFound();
        }
        
	    $page->update($request->all());

	    return $this->respondWithSuccess();
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $page = Page::find($id);

	    if(!$page){
	        return $this->respondNotFound();
        }

        $page->delete();
	    return $this->respondWithSuccess();
    }
}
