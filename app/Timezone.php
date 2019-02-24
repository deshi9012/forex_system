<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Timezone extends Model {
    protected $table = 'timezones';

    protected $fillable = [
        'timezone',
        'created_at',
        'updated_at'
    ];
    protected $hidden = [
        'created_at',
        'updated_at'
    ];

    public function user() {
        return $this->hasMany('App\User');
    }
}
