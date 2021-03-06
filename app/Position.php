<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Position extends BaseModel {
    use SoftDeletes;

    protected $table = 'positions';

    protected $fillable = [
        'name',
        'description',
        'created_at',
        'updated_at',
    ];

    protected $dates = ['deleted_at'];

    public function users() {
        return $this->hasMany('App\User','position_id','id');
    }

}
