<?php

use App\Events\CreateUser;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Auth::routes();

Route::get('clearCookie',function(){

    return redirect('/login')->withCookie(Cookie::forget('username'));
});

Route::get('/', function () {
    return redirect('/login');
});


Route::group(['middleware' => 'auth'],function (){
	Route::group(['middleware' => 'checkRights'], function () {
		Route::group( [ 'namespace' => 'Admin' ], function () {
			Route::get( 'admin', 'AdminController@index' );
		} );

        Route::post('impersonate',['as'=>'user.impersonate','uses'=> 'UserController@impersonate']);

        Route::get('impersonate/out',function(){
            Session::forget('impersonate_id');
            Session::save();
            return redirect('/admin')->withCookie(Cookie::forget('impersonate_mode'));
        });


		Route::get( '/user/find', 'UserController@find' );
		Route::get( '/user/{id}/docs', 'FileController@userDocs' )->name('file.user_docs');;
		Route::resource( '/user', 'UserController' );

        Route::get('timezones','TimezoneController@index');

		Route::resource( 'role', 'RoleController' );
		Route::resource( 'position', 'PositionController' );

		//Route::resource( 'page', 'PageController' );

        Route::get('document-pdf/{id}','DocumentController@dowloadPdf');
		Route::resource( 'document', 'DocumentController' );

		//Route::resource( 'page-category', 'PageCategoryController' );
		//Route::resource( 'page-tag', 'PageTagController' );

		Route::resource( 'document-category', 'DocumentCategoryController' );
		//Route::resource( 'document-tag', 'DocumentTagController' );

        Route::patch('welcome-page/{id}/change-state','WelcomePageController@changeState');
        Route::resource('welcome-page','WelcomePageController');


        Route::resource('history','HistoryController');

        Route::post('history/revert','HistoryController@revertHistory');



		Route::post( '/file/public/generate', 'FileController@getPublicLink' );
		Route::get( '/file/get', 'FileController@get' )->name('file.preview');//required for elfinder and file->preview
		Route::any( '/file/connector', 'FileController@elFinderConnector' );
		Route::resource( 'file', 'FileController' ,['except' => [
            'index'
        ]]);

		Route::get( 'download', 'FileController@download' )->name('file.download');

		Route::get( 'tree', 'PositionController@positionTree' )->name('position.position_tree');

		//	Route::get('/upload', function () {
		//		return view('vendor.elfinder.elfinder');
		//	});


		Route::get( '/storage/view/', 'FileController@storage' )->name('file.work_manuals');
		Route::post( '/file/createDir', 'FileController@createDir')->name('file.create_dir');
		Route::post( '/file/move', 'FileController@moveFile');
        Route::delete('/folder/0','FileController@deleteFolder')->name('file.delete_dir');
		Route::post('/avatar', 'FileController@uploadAvatar');

        Route::post( '/file/renameDir', 'FileController@renameFolder')->name('file.rename_dir');
	});

});
        Route::get('/get/shared-file','FileController@downloadSharedFile');


	Route::get('/permission/find', 'PermissionsController@find');
	Route::resource('permission', 'PermissionsController');

	Route::group(['middleware' => 'checkRights'], function (){
		//Route::resource('user', 'UserController');
		//Route::resource('position', 'PositionController');

	});


Route::get('test',function(){
    return view('test');
});



Route::get('testPer',function(){

    $permissions = DB::table('permissions')->pluck('id');

    $admin = App\Role::find(1);
    $admin->attachPermissions($permissions);
});

Route::get('session',function(){
    dd(Session::all());
});
Route::get('add','UserController@test');
