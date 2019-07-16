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
Route::resource('clientes','ControllerCliente');

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
//Route::post('/colaboradores','ControllerColaborador@store');


         
