<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Tarea;
class ControllerTarea extends Controller
{
    public function index(){
        
        $tareas = Tarea::all();
    
        return view('contenido/tarea',['tareas'=>$tareas]);
    } 
  
    public function store(Request $request)
    {
        $tareas = new Tarea(); 
        $tareas->id_proyecto=request('id_proyecto');
        $tareas->id_desarrollador=request('id_desarrollador');
        $tareas->titulo=request('titulo');
        $tareas->descripcion=request('descripcion');
        $tareas->id_pago=request('id_pago');
        $tareas->estado= '1';
        
        $tareas->save();
        return redirect('/tareas');
  
    
    }

    public function edit(){

        
    }
}
