<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Proyecto;

class ControllerProyecto extends Controller
{
    public function guardarProyectos(){
        $proyecto = new Proyecto();

        $proyecto->nombre= request('nombre');
        $proyecto->save();
        return redirect('principal')
    }
}
