<?php

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

Route::get('/', function () {
<<<<<<< HEAD
    return view('principal');
=======
    return view('index');
>>>>>>> d31da2bff71867c3d940696fb940546a2e4f8940
});
Route::get('/tables', function () {
    return view('tables');
});
/*Route::get('/login', function () {
    return view('login');
});

Route::get('/blank', function () {
    return view('blank');
});
Route::get('/charts', function () {
    return view('charts');
});
Route::get('/forgot', function () {
    return view('forgot-password');
});
Route::get('/register', function () {
    return view('register');
});
*/