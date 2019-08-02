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
 
Route::get('/perfil', function () {
    return view('contenido.personal');
});
Route::get('/reportes', function () {
    return view('contenido.reportes');
});
Route::get('/perfilup','ControllerPerfil@up');

Route::get('/tickets','ControllerTickets@inicio');
Route::post('/tickets','ControllerTickets@store');
Route::post('/verTicket','ControllerTickets@verticket');
Route::post('/ticketsRespuesta','ControllerTickets@responderTickets');

Route::get('/proyectos','ControllerProyecto@inicio');
Route::get('/proyectosDC','ControllerProyecto@inicioDC');
Route::post('/proyectos','ControllerProyecto@store');
Route::post('/proyectosEdit','ControllerProyecto@edit');
Route::post('/proyectosup','ControllerProyecto@update');
Route::get('/{proyed}/proyectos','ControllerProyecto@desactivar');
Route::get('/{proyed}/act','ControllerProyecto@activar');
Route::get('/reportes','ControllerProyecto@reportes');
Route::post('/reportesver','ControllerProyecto@VisualizarReporte');

Route::get('/tareas','ControllerTarea@inicio');
Route::get('/tareasDC','ControllerTarea@inicioDC');
Route::post('/tareas','ControllerTarea@store');
Route::post('/tareasEdit','ControllerTarea@edit');
Route::post('/tareasup','ControllerTarea@update');
Route::get('/{proyed}/tareas','ControllerTarea@desactivar');
Route::get('/{proyed}/tareasact','ControllerTarea@activar');
Route::get('/{proyed}/tareasfin','ControllerTarea@fin');
Route::get('/{proyed}/tareasAct','ControllerTarea@act');

Route::get('/gastos','ControllerGasto@inicio');
Route::post('/gastos','ControllerGasto@store');
Route::post('/gastosEdit','ControllerGasto@edit');
Route::post('/gastosup','ControllerGasto@update');
Route::get('/{proyed}/gastos','ControllerGasto@desactivar');
Route::get('/{proyed}/gastosact','ControllerGasto@activar');

Route::get('/pagos','ControllerPago@inicio');
Route::post('/pagos','ControllerPago@store');
Route::post('/pagosEdit','ControllerPago@edit');
Route::post('/pagosup','ControllerPago@update');
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
Route::post('/manager/actualizar','ControllerManager@update');
Route::get('/{proyed}/manager','ControllerManager@desactivar');
Route::get('/{proyed}/manageract','ControllerManager@activar');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/home','ControllerProyecto@cont');
Route::get('/principal','ControllerProyecto@cont');
Route::get('/regresar', 'HomeController@regresar');
