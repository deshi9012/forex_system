<?php

use Illuminate\Database\Seeder;
use App\Permission;

class PermissionsTableSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {

	    $disabledRoutes = [
	        'login',
            'logout',
            'register',
            'welcome-page.index',
            'welcome-page.show',
            'welcome-page.create',
            'role.create',
            'role.show',
            'position.create',
            'position.show',
            'user.create',
            'page.create',
            'page.destroy',
            'page.edit',
            'page.index',
            'page.show',
            'page.store',
            'page.update',
            'document.create',
            'page-category.create',
            'document-category.create',
            'document-category.show',
            'page-tag.create',
            'document-tag.create',
            'permission.create',
            'permission.destroy',
            'permission.edit',
            'permission.show',
            'permission.store',
            'permission.update',
            'permission.index',
            'history.create',
            'history.store',
            'history.edit',
            'file.create',
            'file.show',
            'file.edit',
            'file.update',
            'history.destroy',
            'elfinder.index',
            'elfinder.popup',
            'elfinder.filepicker',
            'elfinder.tinymce',
            'elfinder.tinymce4',
            'elfinder.ckeditor'
        ];

        $routes = Route::getRoutes();
        foreach ($routes as $route) {
            $routeName = $route->getName();

            if (!$routeName || $routeName == '' || in_array($routeName, $disabledRoutes)) {

                continue;
            }

            Permission::firstOrCreate([
                'name' => $routeName,
                'display_name' => $routeName,
                'description' => 'Can ' . $routeName

            ]);
        }
        $additionalPermissions = [

            'position.index' => [

            ],
            'position.store' => [
                'position.index',
                'position.edit',
                'position.update',
                'position.destroy',
                'user.impersonate',
                'user.store',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy'

            ],
            'position.edit' => [
                'position.index',
                'position.store',
                'position.update',
                'position.destroy',
                'user.impersonate',
                'user.store',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy'
            ],
            'position.update' => [
                'position.index',
                'position.store',
                'position.edit',
                'position.destroy',
                'user.impersonate',
                'user.store',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy'
            ],
            'position.destroy' => [
                'position.index',
                'position.store',
                'position.edit',
                'position.update',
                'user.impersonate',
                'user.store',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy'
            ],

            'position.position_tree' => [
                'user.index',
                'user.show',
            ],

            'user.show' => [
                'user.index',
                'file.user_docs',
                'file.preview',
                'position.position_tree'
            ],

            'user.edit' =>[
                'user.impersonate',
                'user.index',
                'user.show',
                'user.store',
                'user.update',
                'user.destroy',
                'file.user_docs',
                'file.preview',
                'file.store',
                'file.destroy',
                'file.download',
                'file.work_manuals',
                'file.create_dir',
                'file.delete_dir',
                'file.rename_dir',
                'position.position_tree'
            ],
            'user.update' => [
                'user.impersonate',
                'user.index',
                'user.show',
                'user.edit',
                'user.destroy',
                'user.store',
                'file.user_docs',
                'file.preview',
                'file.store',
                'file.destroy',
                'file.download',
                'file.work_manuals',
                'file.create_dir',
                'file.delete_dir',
                'file.rename_dir',
                'position.position_tree'
            ],
            'user.impersonate' =>[
                'user.update',
                'user.index',
                'user.show',
                'user.store',
                'user.edit',
                'user.destroy',
                'file.user_docs',
                'file.preview',
                'file.store',
                'file.destroy',
                'file.download',
                'file.work_manuals',
                'file.create_dir',
                'file.delete_dir',
                'file.rename_dir',
                'position.position_tree'
            ],
            'user.store' => [
                'user.impersonate',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy',
                'file.user_docs',
                'file.preview',
                'file.store',
                'file.destroy',
                'file.download',
                'file.work_manuals',
                'file.create_dir',
                'file.delete_dir',
                'file.rename_dir',
                'position.position_tree'
            ],

            'user.destroy' =>[
                'user.impersonate',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.store',
                'file.user_docs',
                'file.preview',
                'file.store',
                'file.destroy',
                'file.download',
                'file.work_manuals',
                'file.create_dir',
                'file.delete_dir',
                'file.rename_dir',
                'position.position_tree'
            ],
            'role.index'=>[

            ],
            'role.store'=>[
                'role.index',
                'role.edit',
                'role.update',
                'role.destroy',
                'user.impersonate',
                'user.store',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy'
            ],
            'role.edit'=>[
                'role.index',
                'role.store',
                'role.update',
                'role.destroy',
                'user.impersonate',
                'user.store',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy'
            ],
            'role.update'=>[
                'role.index',
                'role.store',
                'role.edit',
                'role.destroy',
                'user.impersonate',
                'user.store',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy'
            ],
            'role.destroy'=>[
                'role.index',
                'role.store',
                'role.edit',
                'role.update',
                'user.impersonate',
                'user.store',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy'
            ],
            'document-category.index' => [

            ],
            'document-category.store' => [
                'document-category.index',
                'document-category.store',
                'document-category.edit',
                'document-category.update',
                'document-category.destroy',
                'document.index',
                'document.store',
                'document.show',
                'document.edit',
                'document.update',
                'document.destroy'
            ],
            'document-category.edit' => [
                'document-category.index',
                'document-category.store',
                'document-category.edit',
                'document-category.update',
                'document-category.destroy',
                'document.index',
                'document.store',
                'document.show',
                'document.edit',
                'document.update',
                'document.destroy'
            ],
            'document-category.update' => [
                'document-category.index',
                'document-category.store',
                'document-category.edit',
                'document-category.update',
                'document-category.destroy',
                'document.index',
                'document.store',
                'document.show',
                'document.edit',
                'document.update',
                'document.destroy'
            ],
            'document-category.destroy' => [
                'document-category.index',
                'document-category.store',
                'document-category.edit',
                'document-category.update',
                'document-category.destroy',
                'document.index',
                'document.store',
                'document.show',
                'document.edit',
                'document.update',
                'document.destroy'
            ],
            'elfinder.connector' => [
                'file.create_dir',
                'file.delete_dir',
                'file.destroy',
                'file.download',
                'file.index',
                'file.preview',
                'file.rename_dir',
                'file.rename_dir',
                'user.destroy',
                'user.edit',
                'user.impersonate',
                'user.index',
                'user.show',
                'user.store',
                'user.update'
            ],
            'file.user_docs' => [
                'file.preview',
                'file.store',
                'file.destroy',
                'file.download',
                'file.work_manuals',
                'file.create_dir',
                'file.delete_dir',
                'file.rename_dir',
                'user.impersonate',
                'user.store',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy'
            ],
            'file.preview' => [
                'file.user_docs',
                'file.store',
                'file.destroy',
                'file.download',
                'file.work_manuals',
                'file.create_dir',
                'file.delete_dir',
                'file.rename_dir',
                'user.impersonate',
                'user.store',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy'
            ],
            'file.store' => [
                'file.user_docs',
                'file.preview',
                'file.destroy',
                'file.download',
                'file.work_manuals',
                'file.create_dir',
                'file.delete_dir',
                'file.rename_dir',
                'user.impersonate',
                'user.store',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy'
            ],
            'file.destroy' => [
                'file.user_docs',
                'file.preview',
                'file.store',
                'file.download',
                'file.work_manuals',
                'file.create_dir',
                'file.delete_dir',
                'file.rename_dir',
                'user.impersonate',
                'user.store',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy'
            ],
            'file.download' => [
                'file.user_docs',
                'file.preview',
                'file.store',
                'file.destroy',
                'file.work_manuals',
                'file.create_dir',
                'file.delete_dir',
                'file.rename_dir',
                'user.impersonate',
                'user.store',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy'
            ],
            'file.work_manuals'=>[
                'file.user_docs',
                'file.preview',
                'file.store',
                'file.destroy',
                'file.download',
                'file.create_dir',
                'file.delete_dir',
                'file.rename_dir',
                'user.impersonate',
                'user.store',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy'
            ],
            'file.create_dir'=>[
                'file.user_docs',
                'file.preview',
                'file.store',
                'file.destroy',
                'file.download',
                'file.work_manuals',
                'file.delete_dir',
                'file.rename_dir',
                'user.impersonate',
                'user.store',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy'
            ],
            'file.delete_dir'=>[
                'file.user_docs',
                'file.preview',
                'file.store',
                'file.destroy',
                'file.download',
                'file.work_manuals',
                'file.create_dir',
                'file.rename_dir',
                'user.impersonate',
                'user.store',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy'
            ],
            'file.rename_dir'=>[
                'file.user_docs',
                'file.preview',
                'file.store',
                'file.destroy',
                'file.download',
                'file.work_manuals',
                'file.create_dir',
                'file.delete_dir',
                'user.impersonate',
                'user.store',
                'user.index',
                'user.show',
                'user.edit',
                'user.update',
                'user.destroy'
            ]
        ];
        //dd($additionalPermissions);
        foreach ($additionalPermissions as $permission => $additionalPermission) {

            if(empty($additionalPermission)) {
                unset($additionalPermissions[$permission]);
                continue;
            }
            $permission = Permission::where('display_name', $permission)->first();
            $additionalPermissionIds = Permission::whereIn('display_name',$additionalPermission)->pluck('id')->toJSON();

            $permission->update(['additional_rights'=> $additionalPermissionIds]);
            $permission->save();

        }

    }

//------------------User All------------------
//
//        user.impersonate
//        user.store
//        user.index
//        user.show
//        user.edit
//        user.update
//        user.destroy
//--------------------------------------------
//
//------------------File All------------------
//        file.user_docs
//        file.preview
//        file.store
//        file.destroy
//        file.download
//        file.work_manuals
//        file.create_dir
//        file.delete_dir
//        file.rename_dir
//--------------------------------------------
//
//------------------Documents All------------------
//        document.index
//        document.store
//        document.show
//        document.edit
//        document.update
//        document.destroy
//--------------------------------------------
//------------------Document Categories All------------------
//        document-category.index
//        document-category.store
//        document-category.edit
//        document-category.update
//        document-category.destroy
//--------------------------------------------
//
//------------------Position All------------------
//
//        position.index
//        position.store
//        position.edit
//        position.update
//        position.destroy
//        position.position_tree
//
//--------------------------------------------
//------------------Role All------------------
//        role.index
//        role.store
//        role.edit
//        role.update
//        role.destroy
//--------------------------------------------

}
