<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreRoleRequest;
use App\Http\Requests\UpdateRoleRequest;
use App\Permission;
use Illuminate\Http\Request;
use App\Role;

class RoleController extends ApiController {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $roles = Role::all();

        return $this->respond($roles);
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
     * @param  \Illuminate\Http\Requesst $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreRoleRequest $request) {

        $role = Role::create($request->all());

        $permissions = Permission::find($request->permission_ids);

        $permissionToAttach = [];
        foreach ($permissions as $permission) {

            if (!in_array($permission->id, $permissionToAttach)) {
                $permissionToAttach[] = $permission->id;
            }
            if ($permission->additional_rights) {
                foreach ($permission->additional_rights as $additional_right) {
                    if (!in_array($additional_right, $permissionToAttach)) {
                        $permissionToAttach[] = $additional_right;
                    }
                }
            }
        }

        //Permissions for login and logout
        //$defaultPermissions = Permission::where('name','login')->orWhere('name','logout')->get();

        $role->attachPermissions($permissionToAttach);

        //$role->attachPermissions($defaultPermissions);

        $role->save();

        return $this->respondCreated();

    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $role = Role::with('permissions')->find($id);

        return $this->respond($role);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $role = Role::with('permissions')->find($id);

        $data['role'] = $role;
        $data['permissions'] = Permission::all();

        return $this->respond($data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateRoleRequest $request, $id) {
        $role = Role::find($id);


        if (!$role) {
            return $this->respondNotFound();
        }

        $role->update($request->all());

        if ($request->has('selected_permissions')) {
            $permissions = Permission::find($request->selected_permissions);

            $permissionToAttach = [];
            foreach ($permissions as $permission) {

                if (!in_array($permission->id, $permissionToAttach)) {
                    $permissionToAttach[] = $permission->id;
                }
                if ($permission->additional_rights) {
                    foreach ($permission->additional_rights as $additional_right) {
                        if (!in_array($additional_right, $permissionToAttach)) {
                            $permissionToAttach[] = $additional_right;
                        }
                    }
                }
            }




            $role->permissions()->sync($permissionToAttach);
            $role->save();
        }

        return $this->respondWithSuccess();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $role = Role::find($id);
        if (!$role) {
            return $this->respondNotFound();
        }
        $role->delete();
    }
}
