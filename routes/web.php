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
    return view('principal');
   
});
Route::get('/tablas', function () {
    return view('tablas');
   
});
Route::get('/tareas', function () {
    return view('tareas');
   
});
Route::get('/factura', function () {
    return view('factura');
});
Route::get('/modales', function () {
    return view('modales');
});/*

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