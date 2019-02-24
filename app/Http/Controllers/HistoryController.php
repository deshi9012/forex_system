<?php

namespace App\Http\Controllers;

use App\History;
use Illuminate\Http\Request;

class HistoryController extends ApiController {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $histories = History::with('user')->get();

        return $this->respond($histories);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {


        $history = History::with('user.position')->find($id);

        if(!$history){
            dd('history doesn\'t exist');
        }

        return $this->respond($history);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        //
    }

    public function revertHistory(Request $request) {
        $history = History::find($request->get('id'));

        if($history->event_type == 'update') {

            $model_name = 'App\\'.$history->section;

            $item = $model_name::withTrashed()->where('id', $history->item_id)->first();
            $item->isRestore = true;

            if($item->trashed()){

                $item->deleted_at = null;

                $item->update($history->before_data);

                $item->save();
            }else{
                $item->update($history->before_data);
                $item->save();
            }
            return $this->respondWithSuccess('success');

        }
    }
}
