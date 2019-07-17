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

Route::get('/', function () {
    return view('principal');
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

/*Route::resource('clientes','ControllerCliente');

//Trae el (index)
//Route::get('/clientes','ControllerCliente@inicio');
//Almacena y muestra
//Route::post('/clientes','ControllerCliente@store');
// Muestra un registro
//Route::get('/clientes/{cliente}','ControllerCliente@show');
// Edita
//Route::get('/clientes/{cliente}/edit','ControllerCliente@edit');
// Se actualiza
//Route::patch('/clientes/{cliente}','ControllerCliente@update');
// DELETE
//Route::delete('/clientes/{cliente}','ControllerCliente@destroy');


Route::resource('tareas','ControllerTarea');
//Route::get('/tareas','ControllerTarea@inicio');
//Route::post('/tareas','ControllerTarea@store');

Route::resource('proyectos','ControllerProyecto');
//Route::get('/proyectos','ControllerProyecto@inicio');
//Route::post('/proyectos','ControllerProyecto@store');


Route::resource('gastos','ControllerGasto');
//Route::get('/gastos','ControllerGasto@inicio');
//Route::post('/gastos','ControllerGasto@store');

Route::resource('pagos','ControllerPago');
//Route::get('/pagos','ControllerPago@inicio');
//Route::post('/pagos','ControllerPago@store');
         
Route::resource('colaboradores','ControllerColaborador');
//Route::get('/colaboradores','ControllerColaborador@inicio');
//Route::post('/colaboradores','ControllerColaborador@store');*/


         
