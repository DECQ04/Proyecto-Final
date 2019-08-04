<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Proyecto;
use App\ProyectoDC;
use App\Manager;
use App\Cliente;
use App\Pago;
use App\Gasto;
use App\Tarea;
use App\Colaborador;
class ControllerProyecto extends Controller
{
    public function cont(){
        $g = Gasto::avg('cantidad');
        $p = Pago::avg('cantidad');
        //$managers = Manager::where('tipo', '=','1')->select('*')->get();
        $n = Proyecto::count();
        $a = Proyecto::where('estado','=','0')->count();
        $aA = Proyecto::where('estado','=','1')->count();
        $proyectos=(100*$a)/$n;

        $nt = Tarea::count();
        $at = Tarea::where('estado','=','0')->count();
        $ad = Tarea::where('estado','=','1')->count();
        $aD =Tarea::where('estado','=','1')->select('titulo','id')->get();
        $tareas=(100*$at)/$nt;

        
        //$users = DB::table('users')->count();
      //  ->count()
            //renombre la vista y por lo tanto renombre el return de contenido/proyecto a -> contenido/proyecto
        return view('principal',['proyectos'=>$proyectos,'g'=>$g,'p'=>$p,'tareas'=>$tareas,'ad'=>$ad,'aD'=>$aD,'aA'=>$aA,'a'=>$a]);
    } 
    public function inicio(){
       
        $managers = Manager::where('tipo', '=','1')->select('*')->get();
        $colaboradores = Cliente::where('tipo', '=','3')->select('*')->get();
        $proyectos = Proyecto::all();
        $pagos = Pago::all();
            //renombre la vista y por lo tanto renombre el return de contenido/proyecto a -> contenido/proyecto
        return view('contenido/proyecto',['proyectos'=>$proyectos,'managers'=>$managers,'colaboradores'=>$colaboradores,'pagos'=>$pagos]);
    } 
   
    public function inicioDC(){
       
         
        $proyectos= Proyecto::join('proyectos_colaboradores','proyectos.id','=','proyectos_colaboradores.id_proyecto')->select('*')->get();
        return view('contenido/proyectoDC',['proyectos'=>$proyectos ]);
    } 
   
   
   
    public function reportes(){
       
       
        $proyectos = Proyecto::where('estado', '=','0')->select('*')->get();
        return view('contenido/reportes',['proyectos'=>$proyectos]);
    } 
    public function VisualizarReporte(Request $request){
       
        $proyectos = Proyecto::findOrFail($request->id); 
        $manager=  Manager::findOrFail($proyectos->id_manager); 
        $cliente=  Manager::findOrFail($proyectos->id_cliente); 
        $tareas = Tarea::where('id_proyecto', '=', $proyectos->id)->
        join('users','users.id','=','tareas.id_desarrollador')->
        join('gastos','gastos.id_tarea','=','tareas.id')
        ->select('tareas.id','users.name','tareas.titulo','gastos.cantidad')->get();
        $pago = Tarea::where('id_proyecto', '=', $proyectos->id)->
        join('users','users.id','=','tareas.id_desarrollador')->
        join('gastos','gastos.id_tarea','=','tareas.id')
        ->select('tareas.id','users.name','tareas.titulo','gastos.cantidad')->avg('gastos.cantidad');
        $pagos=Pago::where('id_proyecto', '=', $proyectos->id)->select('*')->get();
        $pagosT=Pago::where('id_proyecto', '=', $proyectos->id)->select('*')->avg('cantidad');
        
        $colaboradores = Colaborador::where('tipo','=','2')->select('*')->get();
        return view('contenido/reportesVer',
        ['proyectos'=>$proyectos,'pago'=>$pago,'pagosT'=>$pagosT,'pagos'=>$pagos,'manager'=>$manager,
        'cliente'=>$cliente,'tareas'=>$tareas,'colaboradores'=>$colaboradores]);
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
       // $proyectos->id_pago=request('id_pago');
        $proyectos->estado= '1';
        $proyectos->condicion= '1';
        $proyectos->save();
        return redirect('/proyectos');
        //return request()->all();//trae todo del form categoria/create
        //return request('nombre'); este el nombre
        //return request('descripcion'); y asi 
    
    }

    public function desactivar($id){
    $proyectos = Proyecto::findOrFail($id);
    $proyectos->condicion = '0';
    $proyectos->save();
        
    return redirect('/proyectos');
    }
    public function activar($id){
        $proyectos = Proyecto::findOrFail($id);
        $proyectos->condicion = '1';
        $proyectos->save();
            
        return redirect('/proyectos');
    }

    public function edit(Request $request)
    {
       $proyectos = Proyecto::findOrFail(request('id'));
       $pagos = Pago::all();
       $managers = Manager::where('tipo', '=','1')->select('*')->get();
       $colaboradores = Cliente::where('tipo', '=','3')->select('*')->get();
       return view('contenido.proyectoEdit',['proyectos'=>$proyectos,'pagos'=>$pagos,'managers'=>$managers,'colaboradores'=>$colaboradores]);
    
    }
    public function update(Request $request)
    {
        //if (!$request->ajax()) return redirect('/');
        $proyectos = Proyecto::findOrFail($request->id); 
        $proyectos->id_manager=request('id_manager');
        $proyectos->id_cliente=request('id_cliente');
        $proyectos->titulo=request('titulo');
        $proyectos->fecha_incio=request('fecha_inicio');
        $proyectos->fecha_vencimiento=request('fecha_vencimiento');
        $proyectos->pago_total=request('pago_total');
        //$proyectos->id_pago=request('id_pago');
        $proyectos->estado= request('estado');
        $proyectos->condicion= request('condicion');
        
        $proyectos->save();
        return redirect('/proyectos');
    }
}