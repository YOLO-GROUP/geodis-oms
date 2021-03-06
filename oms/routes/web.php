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

Route::get('/', function () {
    return view('welcome');
});

// add new route into middleware group
Route::group(['middleware' => ['auth', 'web']], function() {
	Route::resource('report','ReportController');
});

Auth::routes();

Route::get('/home', 'HomeController@index');
