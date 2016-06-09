<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/


Route::get('login', ['as' => 'auth.login', 'uses' => 'Auth\AuthController@showLoginForm']);
Route::post('login', ['as' => 'auth.login', 'uses' => 'Auth\AuthController@login']);
Route::get('logout', ['as' => 'auth.logout', 'uses' => 'Auth\AuthController@logout']);

// Password Reset Routes...
Route::get('password/reset/{token?}', ['as' => 'auth.password.reset', 'uses' => 'Auth\PasswordController@showResetForm']);
Route::post('password/email', ['as' => 'auth.password.email', 'uses' => 'Auth\PasswordController@sendResetLinkEmail']);
Route::post('password/reset', ['as' => 'auth.password.reset', 'uses' => 'Auth\PasswordController@reset']);

Route::get('/admin', 'HomeController@index');
Route::post('/admin',[
    'uses'=>'HomeController@edition',
    'as'=>'edition'
]);
Route::group(['prefix' => LaravelLocalization::setLocale()], function()
{

    Route::get('/',[
        'uses'=>'artisanController@index',
        'as'=>'index'
    ]);
});
Route::post('/aime',[
    'uses'=>'artisanController@aime',
    'as'=>'aime'
]);
Route::post('/concours',[
    'uses'=>'artisanController@concours',
    'as'=>'concours'
]);
Route::post('/{langue?}',[
    'uses'=>'artisanController@langue',
    'as'=>'langue'
]);


