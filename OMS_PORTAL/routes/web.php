<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Auth::routes();


Route::group([], function() {
    Route::get('/', 'HomeController@index');
    Route::get('/home', 'HomeController@index');
});

Route::match(['get', 'post'], '/changePassword', 'Auth\ChangePasswordController@index');

Route::get('/admin', 'Admin\AdminController@index');

Route::get('/customer', 'Customer\CustomerManagementController@index');

Route::get('/inventory', 'Inventory\InventoryManagementController@index');

Route::get('/order', 'Order\OrderManagementController@index');

Route::get('/report', 'Report\ReportManagementController@index');

