<?php

namespace App\Http\Controllers;

use App\Document;
use App\DocumentCategory;
use App\Http\Requests\StoreDocumentRequest;
use App\Http\Requests\UpdateDocumentRequest;
use App;
use PDF;
use Illuminate\Http\Request;
use PhpParser\Comment\Doc;

class DocumentController extends ApiController {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $documents = Document::all();
        return $this->respond($documents);
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
    public function store(StoreDocumentRequest $request) {
        Document::create($request->all());

        return $this->respondCreated();
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $document = Document::with('categories')->find($id);

        if (!$document) {
            return $this->respondNotFound();
        }
        return $this->respond($document);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
	    //$data['document'] = Document::with('categories')->find($id)->first();

	    $data['document'] = Document::with('categories')->find($id);

	    if (!$data['document']) {
            return $this->respondNotFound();
        }

        $data['categories'] = DocumentCategory::all();
        return $this->respond($data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateDocumentRequest $request, $id) {

	    $document = Document::find($id);

	    if (!$document) {
            return $this->respondNotFound();
        }

	    $document->categories()->sync($request->categories);

        $document->update($request->all());

        return $this->respondWithSuccess();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $document = Document::find($id);
        if (!$document) {
            return $this->respondNotFound();
        }
        $document->delete();
    }

    public function dowloadPdf($id) {
        $doc = Document::find($id);


        return PDF::loadHTML($doc->content)->setPaper('a4', 'landscape')->setWarnings(false)->download('download.pdf');

//        return $pdf->download('invoice.pdf');
//        return $pdf->download('test.pdf');


    }
}
