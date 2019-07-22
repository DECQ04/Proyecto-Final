<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Tarea;
use App\Proyecto;
use App\Colaborador;
use App\Pago;
class ControllerTarea extends Controller
{
    public function inicio(){
        
        $tareas = Tarea::all();
        $proyectos = Proyecto::all();
        $colaboradores = Colaborador::where('tipo','=','2')->select('*')->get();
        $pagos = Pago::all();
    
        return view('contenido/tarea',['pagos'=>$pagos,'tareas'=>$tareas,'proyectos'=>$proyectos,'colaboradores'=>$colaboradores]);
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
    public function desactivar($id){
        $tareas = Tarea::findOrFail($id);
        $tareas->condicion = '0';
        $tareas->save();
            
        return redirect('/tareas');
        }
        public function activar($id){
            $tareas = Tarea::findOrFail($id);
            $tareas->condicion = '1';
            $tareas->save();
                
            return redirect('/tareas');
        }
        public function edit(Request $request)
        {
            $tareas = Tarea::findOrFail(request('id'));
            $proyectos = Proyecto::all();
            $colaboradores = Colaborador::where('tipo','=','2')->select('*')->get();
            $pagos = Pago::all();
           return view('contenido.tareaEdit',['pagos'=>$pagos,'tareas'=>$tareas,'proyectos'=>$proyectos,'colaboradores'=>$colaboradores]);
        
        }
        public function update(Request $request)
        {
            $tareas = Tarea::findOrFail($request->id); 
            $tareas->id_proyecto=request('id_proyecto');
            $tareas->id_desarrollador=request('id_desarrollador');
            $tareas->titulo=request('titulo');
            $tareas->descripcion=request('descripcion');
            $tareas->id_pago=request('id_pago');
            $tareas->estado=request('estado');
            $tareas->condicion=request('condicion');
            $tareas->save();
            return redirect('/tareas');
        }
}
