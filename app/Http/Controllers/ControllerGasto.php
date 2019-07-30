<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Gasto;
use App\Tarea;
class ControllerGasto extends Controller
{
    public function inicio(){
        
        $gastos = Gasto::all();
        $tareas = Tarea::all();
        return view('contenido/gasto',['gastos'=>$gastos,'tareas'=>$tareas]);
    } 
  
    public function store(Request $request)
    {
        $gastos = new Gasto(); 
        $gastos->id_manager=request('id_manager');
        $gastos->id_tarea=request('id_tarea');
        $gastos->descripcion=request('descripcion');
       // $gastos->fecha_hora=request('fecha_hora');
        $gastos->cantidad=request('cantidad');
        
        $gastos->save();
        return redirect('/gastos');
  
    
    }
    public function desactivar($id){
        $gastos = Gasto::findOrFail($id);
        $gastos->condicion = '0';
        $gastos->save();
            
        return redirect('/gastos');
        }
        public function activar($id){
            $gastos = Gasto::findOrFail($id);
            $gastos->condicion = '1';
            $gastos->save();
                
            return redirect('/gastos');
        }


     public function edit(Request $request)
    {
        $gastos = Gasto::findOrFail(request('id'));
        $tareas = Tarea::all();
        return view('contenido.gastosEdit',['gastos'=>$gastos,'tareas'=>$tareas]);
    }

    public function update(Request $request)
    {
        //if (!$request->ajax()) return redirect('/');
        
       
        $gastos = Gasto::findOrFail($request->id);
        $gastos->id_manager=request('id_manager');
        $gastos->id_tarea=request('id_tarea');
        $gastos->descripcion=request('descripcion');
        $gastos->cantidad=request('cantidad');
        $gastos->condicion=request('condicion');
        $gastos->save();
        return redirect('/gastos');
       
    }
}
