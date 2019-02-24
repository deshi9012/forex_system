<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreDocumentCategoryRequest;
use App\Http\Requests\UpdateDocumentCategoryRequest;
use Illuminate\Http\Request;
use App\DocumentCategory;

class DocumentCategoryController extends ApiController {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $documentCategories = DocumentCategory::all();
        return $this->respond($documentCategories);
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
    public function store(StoreDocumentCategoryRequest $request) {

        DocumentCategory::create($request->all());
        return $this->respondCreated();
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
//    public function show($id) {
//        $documentCategories = DocumentCategory::find($id);
//
//        if(!$documentCategories){
//            dd('documentCategories doesn\'t exist');
//        }
//        return view()->with('documentCategories',$documentCategories);
//    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $documentCategory = DocumentCategory::find($id);
        if(!$documentCategory){
            return $this->respondNotFound();
        }
        return $this->respond($documentCategory);
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateDocumentCategoryRequest $request, $id) {
        $documentCategory = DocumentCategory::find($id);
        if(!$documentCategory){
            return $this->respondNotFound();
        }
        $documentCategory->update($request->input());

        return $this->respondWithSuccess();
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $documentCategory = DocumentCategory::find($id);
        if(!$documentCategory){
            return $this->respondNotFound();
        }
        $documentCategory->delete();
    }
}
