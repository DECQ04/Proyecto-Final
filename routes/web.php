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
    return view('index');
});
Route::get('/tables', function () {
    return view('tables');
});

Route::get('/tarea','tareaController@index');
        Route::post('/tarea/registrar', 'tareaController@store');
        Route::put('/tarea/actualizar', 'tareaController@update');
        Route::put('/tarea/desactivar', 'tareaController@desactivar');
        Route::put('/tarea/activar', 'tareaController@activar');
        Route::get('/tarea/buscarTarea', 'tareaController@buscarTarea');
        Route::get('/tarea/listarTarea', 'tareaController@listarTarea');
         
