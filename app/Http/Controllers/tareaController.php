<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Tarea;
class tareaController extends Controller
{
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $buscar = $request->buscar;
        $criterio = $request->criterio;
        
        if ($buscar==''){
            $tareas = Tarea::join('personas','tareas.id_desarrollador','=','personas.id')
            ->select('tareas.id','tareas.id_desarrollador','tareas.id_proyecto','tareas.nombre','personas.nombre as desarrollador','tareas.descripcion','tareas.id_pago','tareas.estado')
            ->orderBy('tareas.id', 'desc')->paginate(10);
        }
        else{
            $tareas = Tarea::join('personas','tareas.id_desarrollador','=','personas.id')
            ->select('tareas.id','tareas.id_desarrollador','tareas.id_proyecto','tareas.nombre','personas.nombre as desarrollador','tareas.descripcion','tareas.id_pago','tareas.estado')
            ->where('tareas.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('tareas.id', 'desc')->paginate(10);
        }
        return [
            'pagination' => [
                'total'        => $tareas->total(),
                'current_page' => $tareas->currentPage(),
                'per_page'     => $tareas->perPage(),
                'last_page'    => $tareas->lastPage(),
                'from'         => $tareas->firstItem(),
                'to'           => $tareas->lastItem(),
            ],
            'tareas' => $tareas
        ];
    }

    public function listarTarea(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $buscar = $request->buscar;
        $criterio = $request->criterio;
        
        if ($buscar==''){
            $tareas = Tarea::join('personas','tareas.id_desarrollador','=','personas.id')
            ->select('tareas.id','tareas.id_desarrollador','tareas.id_proyecto','tareas.nombre','personas.nombre as desarrollador','tareas.descripcion','tareas.id_pago','tareas.estado')
            ->orderBy('tareas.id', 'desc')->paginate(10);
        }
        else{
            $tareas = Tarea::join('personas','tareas.id_desarrollador','=','personas.id')
            ->select('tareas.id','tareas.id_desarrollador','tareas.id_proyecto','tareas.nombre','personas.nombre as desarrollador','tareas.descripcion','tareas.id_pago','tareas.estado')
            ->where('tareas.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('tareas.id', 'desc')->paginate(10);
        }
        

        return ['tareas' => $tareas];
    }
    public function buscarTarea(Request $request){
        if (!$request->ajax()) return redirect('/');

        $filtro = $request->filtro;
        $tareas = Tarea::where('id','=', $filtro)
        ->select('id','titulo')->orderBy('titulo', 'asc')->take(1)->get();

        return ['tareas' => $tareas];
    }

    public function buscarTareasAct(Request $request){
        if (!$request->ajax()) return redirect('/');

        $filtro = $request->filtro;
        $tareas = Tarea::where('id','=', $filtro)
        ->select('id','titulo','id_proyecto','id_desarrollador')
        ->where('estado','=','1')
        ->orderBy('titulo', 'asc')
        ->take(1)->get();

        return ['tareas' => $tareas];
    } 

    public function store(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $tareas = new Tarea();
        $tareas->id_proyecto = $request->id_proyecto;
        $tareas->id_desarrollador = $request->id_desarrollador;
        $tareas->titulo = $request->titulo;
        $tareas->descripcion = $request->descripcion;
        $tareas->id_pago = $request->id_pago;
        $tareas->estado = '1';
        $tareas->save();
    }
    public function update(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $tareas = Tarea::findOrFail($request->id);
        $tareas->id_proyecto = $request->id_proyecto;
        $tareas->id_desarrollador = $request->id_desarrollador;
        $tareas->titulo = $request->titulo;
        $tareas->descripcion = $request->descripcion;
        $tareas->id_pago = $request->id_pago;
        $tareas->estado = '1';
        $tareas->save();
    }
    
    public function desactivar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $tareas = Tarea::findOrFail($request->id);
        $tareas->estado = '0';
        $tareas->save();
    }

    public function activar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $tareas = Tarea::findOrFail($request->id);
        $tareas->estado = '1';
        $tareas->save();
    }




}
