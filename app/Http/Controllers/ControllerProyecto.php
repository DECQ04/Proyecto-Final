<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Proyecto;
class ControllerProyecto extends Controller
{
    public function index(){
        
        $proyectos = Proyecto::all();
            //renombre la vista y por lo tanto renombre el return de contenido/proyecto a -> contenido/proyecto
        return view('contenido/proyecto',['proyectos'=>$proyectos]);
    } 
  
    public function store(Request $request)
    {
        $proyectos = new Proyecto(); 
        $proyectos->id_manager=request('id_manager');
        $proyectos->id_cliente=request('id_cliente');
        $proyectos->titulo=request('titulo');
        $proyectos->fecha_incio=request('fecha_inicio');
        $proyectos->fecha_vencimiento=request('fecha_vencimiento');
        $proyectos->pago_total=request('pago_total');
        $proyectos->id_pago=request('id_pago');
        $proyectos->estado= '1';
        $proyectos->save();
        return redirect('/proyectos');
        //return request()->all();//trae todo del form categoria/create
        //return request('nombre'); este el nombre
        //return request('descripcion'); y asi 
    
    }
   
}