<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Gasto;

class ControllerGasto extends Controller
{
    public function index(){
        
        $gastos = Gasto::all();
    
        return view('contenido/gasto',['gastos'=>$gastos]);
    } 
  
    public function store(Request $request)
    {
        $gastos = new Gasto(); 
        $gastos->id_manager=request('id_manager');
        $gastos->titulo=request('titulo');
        $gastos->descripcion=request('descripcion');
        $gastos->fecha_hora=request('fecha_hora');
        $gastos->cantidad=request('cantidad');
        
        $gastos->save();
        return redirect('/gastos');
  
    
    }
}
