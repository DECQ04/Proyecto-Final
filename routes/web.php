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

Route::get('/proyecto','ControllerProyecto@inicio');
Route::post('/proyecto','ControllerProyecto@store');

Route::get('/tareas','ControllerTarea@inicio');
Route::post('/tareas','ControllerTarea@store');
         
