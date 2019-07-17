<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Colaborador;

class ControllerColaborador extends Controller
{
    public function inicio(){
        
       

        $colaboradores = Colaborador::where('tipo','=','2')->select('*')->get();

        return view('contenido/colaborador',['colaboradores'=>$colaboradores]);
    } 
  
    public function store(Request $request)
    {
        $colaboradores = new Colaborador(); 
        $colaboradores->nombre=request('nombre');
        $colaboradores->apellido=request('apellido');
        $colaboradores->tipo='2';
        $colaboradores->correo_electronico=request('correo_electronico');
        $colaboradores->contraseña=request('contraseña');
        $colaboradores->telefono=request('telefono');
        
        
        
        
        $colaboradores->save();
        return redirect('/colaboradores');
  
    
    }
    public function desactivar($id){
        $colaboradores = Colaborador::findOrFail($id);
        $colaboradores->condicion = '0';
        $colaboradores->save();
            
        return redirect('/colaboradores');
        }
        public function activar($id){
            $colaboradores = Colaborador::findOrFail($id);
            $colaboradores->condicion = '1';
            $colaboradores->save();
                
            return redirect('/colaboradores');
        }
}
