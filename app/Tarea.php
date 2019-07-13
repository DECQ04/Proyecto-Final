<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tarea extends Model
{
<<<<<<< HEAD
    //
=======
    protected $fillable =[
        'id_proyecto','id_desarrollador',
        'titulo','descripcion','id_pago',
        'estado'
    ];
    public function proyecto(){
        return $this->belongsTo('App\Proyecto');
    }
    public function desarrollador(){
        return $this->belongsTo('App\Desarrollador');
    }
    public function pago(){
        return $this->belongsTo('App\Pago');
    }
>>>>>>> d26a775d27b5c8032789acc9f498d72516d8344d
}
