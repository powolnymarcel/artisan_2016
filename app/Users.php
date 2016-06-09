<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Users extends Model
{
    protected $table = 'users';

   public function videos(){
       return $this->belongsToMany('App\Videos');
   }
}
