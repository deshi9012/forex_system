<?php

namespace App\Http\Controllers;

use App\Permission;
use App\Position;
use App\Role;
use App\Http\Requests\StoreUserRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Timezone;
use App\User;
use Illuminate\Http\Request;
use App\Events\CreateUser;
use App\Events\UserWasDeleted;
use Session;
use Storage;

class UserController extends ApiController {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {

        $users = User::with('roles')->with('position')->with('superior')->orderBy('id','desc')->get();

        return $this->respond($users);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
//        return view('user.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreUserRequest $request) {

        $user = User::create($request->all());

        $roles = Role::find($request->selected_roles);

        foreach ($roles as $role) {
            $user->attachRole($role);
        }


        $user->save();

        event(new CreateUser($user));
        return $this->respondCreated();

    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {

	    $user = User::with('roles')->with('position')->with('superior')->with('timezone')->find($id);

	    if(!$user){
            dd('user doesn\'t exist');
        }
	    return $this->respond($user);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $user = User::with(['roles' => function($query){$query->select('id');}])->with('position')->with('superior')->find($id);

	    if(!$user){
		    return $this->respondNotFound();
	    }

	    $data['user'] = $user;
        $data['timezones'] = Timezone::all();
	    $data['positions'] = Position::whereNotIn('name',['CEO'])->get();
	    $data['roles'] = Role::all();

        return $this->respond($data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateUserRequest $request, $id) {
        $user = User::find($id);

        if(!$user){
            return $this->respondNotFound();
        }

        $user->update($request->all());
	    $user->detachRoles($user->roles);
	    $user->save();

	    if ($request->has('selected_roles')) {
            foreach ($request->selected_roles as $role) {
		        $roleObj = Role::find($role);
		        $user->attachRole($roleObj);
	        }
	    }

	    $user->save();

        return $this->respondWithSuccess();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $user = User::find($id);
        if(!$user){
            return $this->respondNotFound();
        }

        /*TODO
        *Must check if user is CEO
        */
        if($user->position->name == 'CEO'){
            $this->setStatusCode(400);
            return $this->respondWithError('You can\'t delete our CEO :)');
        }
        //trigger event that attach subordinate users
        event(new UserWasDeleted($user));

        $user->delete();
    }


	public function find(Request $request) {
		return parent::search(new User(), $request, ['first_name', 'last_name', 'email']);
    }

    public function impersonate(Request $request) {
        $user = User::find($request->get('id'));
        //dd(\Auth::user());
        Session::put('impersonate_id',$user->id);
        Session::put('full_name',$user->full_name);
        Session::save();
        return $this->respond(['impersonate_mode' => 'true']);
        //\Auth::login($user);
        //dd(\Auth::user());
        //dd($user->roles);
    }
    
}
