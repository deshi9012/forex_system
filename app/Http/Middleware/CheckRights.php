<?php

namespace App\Http\Middleware;

use App\Http\Controllers\ApiController;
use App\Permission;
use Closure;
use Session;
use App\User;
class CheckRights {
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next) {

        $action = $request->route()->getName();

	    $permission = Permission::where('name', $action)->first();

        if(Session::get('impersonate_id') == null){
            $user = \Auth::user();
        }else{
            $user = User::find(Session::get('impersonate_id'));
        }


        if (is_null($action) || !$permission || $user->can($action) || $user->id == 1 || $action == 'welcome-page.update' || $action == 'welcome-page.edit') {
            return $next($request);
        } else {
            $api = new ApiController();

	        $msg = "You don't have ". $action;

            return $api->respondForbidden($msg);
        }
    }
}