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
    return view('layouts.app');
});

Route::get('/proyectos','ControllerProyecto@inicio');
Route::post('/proyectos','ControllerProyecto@store');
Route::get('/{proyed}/proyectos','ControllerProyecto@desactivar');
Route::get('/{proyed}/act','ControllerProyecto@activar');

Route::get('/tareas','ControllerTarea@inicio');
Route::post('/tareas','ControllerTarea@store');
Route::get('/{proyed}/tareas','ControllerTarea@desactivar');
Route::get('/{proyed}/tareasact','ControllerTarea@activar');

Route::get('/gastos','ControllerGasto@inicio');
Route::post('/gastos','ControllerGasto@store');
Route::get('/{proyed}/gastos','ControllerGasto@desactivar');
Route::get('/{proyed}/gastosact','ControllerGasto@activar');

Route::get('/pagos','ControllerPago@inicio');
Route::post('/pagos','ControllerPago@store');
Route::get('/{proyed}/pagos','ControllerPago@desactivar');
Route::get('/{proyed}/pagosact','ControllerPago@activar');
         
Route::get('/colaboradores','ControllerColaborador@inicio');
Route::post('/colaboradores','ControllerColaborador@store');
Route::get('/{proyed}/colaboradores','ControllerColaborador@desactivar');
Route::get('/{proyed}/colaboradoresact','ControllerColaborador@activar');

Route::get('/clientes','ControllerCliente@inicio');
Route::post('/clientes','ControllerCliente@store');
Route::get('/{proyed}/clientes','ControllerCliente@desactivar');
Route::get('/{proyed}/clientesact','ControllerCliente@activar');

Route::get('/manager','ControllerManager@inicio');
Route::post('/manager','ControllerManager@store');
Route::get('/{proyed}/manager','ControllerManager@desactivar');
Route::get('/{proyed}/manageract','ControllerManager@activar');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
