@extends('principal')
<<<<<<< HEAD
    @section('contenido')


    <template v-if="menu==1">
    <h1>-------------------------------------------------------------------------------</h1>
    </template>







    @endsection
=======
@section('contenido')
           <template v-if="menu==0">
           <h1>Menu 0</h1> 
           </template>

            <template v-if="menu==1">            
            <h1>Menu 1 </h1>
            </template>

            <template v-if="menu==2">
            <h1>Menu 2</h1>
            </template>

            <template v-if="menu==3">
            <h1>Menu 3</h1>
            </template>

            <template v-if="menu==4">
            <h1>Menu 4</h1>
            </template>

            <template v-if="menu==5">
            <h1>Menu 5</h1>
            </template>

 @endsection
>>>>>>> d31da2bff71867c3d940696fb940546a2e4f8940
