<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Videos extends Model
{
    protected $table = 'videos';

    protected $fillable=[
        'aime','users_id'
    ];

    public function  users(){
        return $this->belongsToMany('App\Users');
    }
   
}
