<?php

namespace App\Http\Controllers;

use App\DocumentTag;
use App\Http\Requests\StoreDocumentTagRequest;
use App\Http\Requests\UpdateDocumentTagRequest;
use Illuminate\Http\Request;

class DocumentTagController extends ApiController  {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $documentTags = DocumentTag::all();
        return $this->respond($documentTags);
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
    public function store(StoreDocumentTagRequest $request) {
        DocumentTag::create($request->input());

        return $this->respondCreated();
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $documentTag = DocumentTag::find($id);

        if(!$documentTag){
            dd('documentTag doesn\'t exist');
        }
        return view()->with('documentTag',$documentTag);
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $documentTag = DocumentTag::find($id);
        if(!$documentTag){
            return $this->respondNotFound();
        }
        return $this->respond($documentTag);
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateDocumentTagRequest $request, $id) {
        $documentTag = DocumentTag::find($id);
        if(!$documentTag){
            return $this->respondNotFound();
        }
        $documentTag->update($request->input());

        return $this->respondWithSuccess();
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $documentTag = DocumentTag::find($id);
        if(!$documentTag){
            return $this->respondNotFound();
        }
        $documentTag->delete();
    }
}
