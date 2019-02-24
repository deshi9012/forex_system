<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use JavaScript;

class AdminController extends Controller {
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct() {

    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $data['username'] = Auth::user()['username'];
        $data['avatar'] = Auth::user()['avatar'];
        $data['id'] = Auth::user()['id'];
	    $data['menu_items'] = $this->getMenuItems();

	    /* Permissions array for JS */
	    $permissionList = [];
	    foreach(Auth::user()->roles()->get() as $role) {
		    $roles[] = $role->permissions()->get()->toArray();
	    }

	    foreach ($roles as $role) {
		    foreach ($role as $permissions) {
			    $permissionList[] = $permissions['name'];
		    }
	    }

	    JavaScript::put([
		    'menu_items' => $this->getMenuItems(),
            'user_id'   =>  Auth::user()['id'],
		    'user_permissions' => $permissionList
	    ]);

	    return view('index', $data);
    }

    protected function getMenuItems() {

	    $user = Auth::user();

	    $menu = [

            ['permission' => 'user.index', 'title' => 'HR', 'href' => '#', 'iconClass' => '','class'=> 'menu-label' ],
	        ['permission' => 'user.index', 'title' => 'Users', 'href' => '/user', 'iconClass' => 'icon-user'],
            ['permission' => 'user.index', 'title' => 'Position tree', 'href' => '/tree', 'iconClass' => 'icon-share'],

            //['permission' => 'page.index', 'title' => 'CMS', 'href' => '#', 'iconClass' => '','class'=> 'menu-label'],
            //['permission' => 'page.index', 'title' => 'Pages', 'href' => '/page', 'iconClass' => 'icon-layers'],
			['permission' => 'document.index', 'title' => 'Documents', 'href' => '/document/', 'iconClass' => 'icon-folder-alt'],
			['permission' => 'document-category.index', 'title' => 'Categories', 'href' => '/category/document', 'iconClass' => 'icon-notebook', 'subItems' => [
		                                                                                                ['permission' => 'document-category.index', 'title' =>'Document', 'href' => '/category/document']
		                                                                                                //['permission' => 'page-category.index', 'title' =>'Page', 'href' =>'/category/page']
							]],
            ['permission' => 'file.preview', 'title' => 'Files', 'href' => '#', 'iconClass' => '','class'=> 'menu-label'],
            ['permission' => 'file.work_manuals', 'title' => 'Work Manuals', 'href' => '/file/manuals/', 'iconClass' => 'icon-docs'],
            ['permission' => 'elfinder.connector', 'title' => 'Content Bank', 'href' => '/file-manager/content', 'iconClass' => 'icon-docs'],
            ['permission' => 'elfinder.connector', 'title' => 'Creative Bank', 'href' => '/file-manager/creative', 'iconClass' => 'icon-docs'],
            ['permission' => 'file.user_docs', 'title' => 'User files', 'href' => '/file-manager/users', 'iconClass' => 'icon-docs'],

               ///Here is the problem
            ['permission' => 'role.index', 'title' => 'Settings',  'href' => '/role', 'iconClass' => 'icon-settings', 'subItems' =>[
							                                                                        ['permission' => 'role.index', 'title' =>'Roles', 'href' => '/role'],
							                                                                        ['permission' => 'history.index', 'title' =>'History', 'href' => '/history'],
							                                                                        ['permission' => 'position.index', 'title' =>'Positions', 'href' => '/position']
							]],

	    ];

	    if($user->id == 1) {
		    return $menu;
	    }

	    foreach ($menu as $key => $menuItem) {

		    if (!is_array($menuItem['permission'])) {

			    if($user->can($menuItem['permission'])) {
				    continue;
			    }
		    }

		    if(key_exists('subItems', $menuItem) && is_array($menuItem['subItems'])) {
			    foreach ($menuItem['subItems'] as $subKey => $value) {
                    if($user->can($value['permission'])) {
                        continue;
                    }
                    unset($menuItem[$subKey]);
			    }
		    }


			unset($menu[$key]);
	    }

	    return $menu;
    }
}

	
