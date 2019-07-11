<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tarea extends Model
{
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
}
