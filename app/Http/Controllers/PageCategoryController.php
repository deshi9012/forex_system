<?php

namespace App\Http\Controllers;
use App\Http\Requests\StorePageCategoryRequest;
use App\Http\Requests\UpdatePageCategoryRequest;
use App\PageCategory;
use Illuminate\Http\Request;

class PageCategoryController extends ApiController {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $pageCategory = PageCategory::all();
        return $this->respond($pageCategory);
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
    public function store(StorePageCategoryRequest $request) {
        PageCategory::create($request->input());
        return $this->respondCreated();
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $pageCategory = PageCategory::find($id);

        if(!$pageCategory){
            dd('pageCategory doesn\'t exist');
        }
        return view()->with('pageCategory',$pageCategory);
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $pageCategory = PageCategory::find($id);
        if(!$pageCategory){
            return $this->respondNotFound();
        }
        return $this->respond($pageCategory);
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePageCategoryRequest $request, $id) {
        $pageCategory= PageCategory::find($id);

        if(!$pageCategory){
            return $this->respondNotFound();

        }
        $pageCategory->update($request->all());

        return $this->respondWithSuccess();
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $pageCategory= PageCategory ::find($id);
        if(!$pageCategory){
            return $this->respondNotFound();
        }
        $pageCategory->delete();
    }
}
