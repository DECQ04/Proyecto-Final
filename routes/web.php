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

Route::get('/proyectos','ControllerProyecto@inicio');
Route::post('/proyectos','ControllerProyecto@store');

Route::get('/tareas','ControllerTarea@inicio');
Route::post('/tareas','ControllerTarea@store');

Route::get('/gastos','ControllerGasto@inicio');
Route::post('/gastos','ControllerGasto@store');

Route::get('/pagos','ControllerPago@inicio');
Route::post('/pagos','ControllerPago@store');
         
Route::get('/colaboradores','ControllerColaborador@inicio');
Route::post('/colaboradores','ControllerColaborador@store');

Route::get('/clientes','ControllerCliente@inicio');
Route::post('/clientes','ControllerCliente@store');
         
