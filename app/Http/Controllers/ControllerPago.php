<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Pago;

class ControllerPago extends Controller
{
    public function inicio(){
        
        $pagos = Pago::all();
    
        return view('contenido/pago',['pagos'=>$pagos]);
    } 
  
    public function store(Request $request)
    {
        $pagos = new Pago(); 
        $pagos->id_persona=request('id_persona');
        $pagos->cantidad=request('cantidad');
        $pagos->fecha_hora=request('fecha_hora');
        $pagos->estado=request('estado');
        $pagos->descripcion=request('descripcion');
        
        
        
        $pagos->save();
        return redirect('/pagos');
  
    
    }
    public function desactivar($id){
        $pagos = Pago::findOrFail($id);
        $pagos->condicion = '0';
        $pagos->save();
            
        return redirect('/pagos');
        }
        public function activar($id){
            $pagos = Pago::findOrFail($id);
            $pagos->condicion = '1';
            $pagos->save();
                
            return redirect('/pagos');
        }
}
