<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Manager;
class ControllerManager extends Controller
{
     public function inicio(){
        
        $managers = Manager::where('tipo', '=','1')->select('*')->get();
    
        return view('contenido/manager',['managers'=>$managers]);
    } 
  
    public function store(Request $request)
    {
        $managers = new Manager(); 
        $managers->name=request('nombre');
       // $managers->apellido=request('apellido');
        $managers->tipo='1';
        $managers->email=request('correo_electronico');
        $managers->password=Hash::make(request('contraseña'));
        $managers->telefono=request('telefono');
        $managers->save();
        return redirect('/manager');
  
    
    } 
    public function desactivar($id){
        $managers = Manager::findOrFail($id);
        $managers->condicion = '0';
        $managers->save();
            
        return redirect('/manager');
        }
        public function activar($id){
            $managers = Manager::findOrFail($id);
            $managers->condicion = '1';
            $managers->save();
                
            return redirect('/manager');
        }
}
