<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Tickets;

class ControllerTickets extends Controller
{
    public function inicio(){
        
       /* $tickets = Tickets::all();
      
    
        return view('contenido/tickets',['tickets'=>$tickets]);*/


        $tickets= Tickets::join('tareas','tickets.id_tarea','=','tareas.id')->
        select('tareas.id_desarrollador as desarrollador', 'tickets.id','tickets.id_cliente', 'tickets.id_tarea', 'tickets.titulo', 'tickets.descripcion', 'tickets.fecha_hora', 'tickets.condicion', 'tickets.estado')->get();
        return view('contenido/tickets',['tickets'=>$tickets]);
     




    } 
}
