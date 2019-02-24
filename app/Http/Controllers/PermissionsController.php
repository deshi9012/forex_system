<?php

namespace App\Http\Controllers;

use App\Permission;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

class PermissionsController extends ApiController {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        //return $this->refreshPermissions();

        $permissions = Permission::all();

        return $this->respond($permissions);
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
        //
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

    //Dont need this method anymore, we have migration for that puropse
//    public function refreshPermissions() {
//        $routes = Route::getRoutes();
//        foreach ($routes as $route) {
//            $routeName = $route->getName();
//            if (!$routeName || $routeName == '') {
//                continue;
//            }
//
//            Permission::firstOrCreate(['name' => $routeName, 'display_name' => $routeName, 'description' => 'Can ' . $routeName]);
//        }
//    }

    public function find(Request $request) {
        return parent::search(new Permission(), $request);
    }
}
