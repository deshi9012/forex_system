<?php

namespace App\Http\Controllers;
use App\Http\Requests\StorePageTagRequest;
use App\Http\Requests\UpdatPageTagRequest;
use App\PageTag;
use Illuminate\Http\Request;

class PageTagController extends ApiController {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $pageTags = PageTag::all();
        return $this->respond($pageTags);
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
    public function store(StorePageTagRequest $request) {
        PageTag::create($request->input());
        return $this->respondCreated();
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $pageTag = PageTag::find($id);

        if(!$pageTag){
            dd('pageTag doesn\'t exist');
        }
        return view()->with('pageTag',$pageTag);
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $pageTag = PageTag::find($id);
        if(!$pageTag){
            return $this->respondNotFound();
        }
        return $this->respond($pageTag);
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatPageTagRequest $request, $id) {
        $pageTag = PageTag::find($id);
        if(!$pageTag){
            return $this->respondNotFound();
        }

        $pageTag->update($request->input());

        return $this->respondWithSuccess();
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $pageTag = PageTag::find($id);
        if(!$pageTag){
            return $this->respondNotFound();
        }
        $pageTag->delete();
    }
}
