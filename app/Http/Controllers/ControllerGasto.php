<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Gasto;

class ControllerGasto extends Controller
{
    public function inicio(){
        
        $gastos = Gasto::all();
    
        return view('contenido/gasto',['gastos'=>$gastos]);
    } 
  
    public function store(Request $request)
    {
        $gastos = new Gasto(); 
        $gastos->id_manager=request('id_manager');
        $gastos->titulo=request('titulo');
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
        return view('contenido.gastosEdit',['gastos'=>$gastos]);
    }

    public function update(Request $request)
    {
        //if (!$request->ajax()) return redirect('/');
        
       
        $gastos = Gasto::findOrFail($request->id);
        $gastos->id_manager=request('id_manager');
        $gastos->titulo=request('titulo');
        $gastos->descripcion=request('descripcion');
        $gastos->cantidad=request('cantidad');
        $gastos->condicion=request('condicion');
        $gastos->save();
        return redirect('/gastos');
       
    }
}
