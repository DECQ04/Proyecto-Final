<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Cliente;

class ControllerCliente extends Controller
{
    public function inicio(){
        
        $colaboradores = Cliente::all();
    
        return view('contenido/cliente',['colaboradores'=>$colaboradores]);
    } 
  
    public function store(Request $request)
    {
        $colaboradores = new Cliente(); 
        $colaboradores->nombre=request('nombre');
        $colaboradores->apellido=request('apellido');
        $colaboradores->tipo='3';
        $colaboradores->correo_electronico=request('correo_electronico');
        $colaboradores->contraseña=request('contraseña');
        $colaboradores->telefono=request('telefono');
        
        
        
        
        $colaboradores->save();
        return redirect('/clientes');
  
    
    }
}
