<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Tickets;
use App\Tarea;
use App\Cliente;
class ControllerTickets extends Controller
{
    public function inicio(){
        
       /* $tickets = Tickets::all();
      
    
        return view('contenido/tickets',['tickets'=>$tickets]);*/


        $tickets= Tickets::join('tareas','tickets.id_tarea','=','tareas.id')->
        select('tareas.id_desarrollador as desarrollador', 'tickets.id','tickets.id_cliente', 'tickets.id_tarea', 'tickets.titulo', 'tickets.descripcion', 'tickets.fecha_hora', 'tickets.condicion', 'tickets.estado')->get();
        $tareas = Tarea::all();
        return view('contenido/tickets',['tickets'=>$tickets,'tareas'=>$tareas]);
     
    } 

    public function store(Request $request)
    { 
        $tickets = new Tickets(); 
        $tickets->id_cliente=request('id_cliente');
        $tickets->id_tarea=request('id_tarea');
        $tickets->titulo=request('titulo');
        $tickets->descripcion=request('descripcion');
        $tickets->condicion='1';
        $tickets->estado= '1';
        $tickets->save();
        return redirect('/tickets');
  
    
    }

    
    public function verticket(Request $request)
        {
            $tickets = Tickets::findOrFail(request('id')); 
            $cliente = Cliente::findOrFail($tickets->id_cliente); 
           return view('contenido.dialogo',[ 'tickets'=>$tickets,'cliente'=>$cliente ]);
        
        }
}
