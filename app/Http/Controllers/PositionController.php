<?php

namespace App\Http\Controllers;

use App\Http\Requests\UpdatePositionRequest;
use App\Http\Requests\StorePositionRequest;
use App\Position;
use Illuminate\Http\Request;
use App\User;


class PositionController extends ApiController {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $positions = Position::whereNotIn('name',['CEO'])->get();

        return $this->respond($positions);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
//    public function create() {
//
//    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(StorePositionRequest $request) {

        Position::create($request->input());
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
//    public function show($id) {
//        $position = Position::find($id);
//        return view('position.show')->with('position', $position);
//    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $position = Position::find($id);
        return $this->respond($position);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePositionRequest $request, $id) {
        $position = Position::find($id);
        $position->update($request->input());

        $position->save();

        return $this->respondWithSuccess();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $position = Position::find($id);
        $position->delete();
    }

    protected function buildPositionTree(array $users, $superiorId = 0) {

        $branch = [];

        foreach ($users as $user) {

            if ($user['superior_id'] == $superiorId) {
//                echo '<ul>' . $user['username'];

                $subordinate = $this->buildPositionTree($users, $user['id']);
                if ($subordinate) {
                    $user['subordinate'] = $subordinate;
                }
//                echo '<li>' . $user['username'] . '</li>';
                $branch[] = $user;
//                echo '</ul>';
            }
        }

        return $branch;
    }

    public function positionTree() {

        $users = User::select('id', 'superior_id', 'first_name', 'last_name','position_id','avatar')
                        ->with('subordinate')
                        ->with(['position' => function($query){ $query->select('id','name'); }])
                        ->get()
                        ->toArray();


        $tree = $this->buildPositionTree($users);

        $tree[0]['title'] = "Something";
	    $tree[0]['subordinate'][0]['title'] = "Something";

        return $this->respond($tree);
//        return view('tree')->with('data',$tree);
    }
}
