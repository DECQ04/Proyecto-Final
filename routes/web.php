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
>>>>>>> d26a775d27b5c8032789acc9f498d72516d8344d
});
Route::get('/tablas', function () {
    return view('tablas');
   
});
<<<<<<< HEAD
Route::get('/tareas', function () {
    return view('tareas');
   
});
Route::get('/factura', function () {
    return view('factura');
});
Route::get('/modales', function () {
    return view('modales');
});/*
=======
>>>>>>> d26a775d27b5c8032789acc9f498d72516d8344d

Route::get('/tarea','tareaController@index');
        Route::post('/tarea/registrar', 'tareaController@store');
        Route::put('/tarea/actualizar', 'tareaController@update');
        Route::put('/tarea/desactivar', 'tareaController@desactivar');
        Route::put('/tarea/activar', 'tareaController@activar');
        Route::get('/tarea/buscarTarea', 'tareaController@buscarTarea');
        Route::get('/tarea/listarTarea', 'tareaController@listarTarea');
         
