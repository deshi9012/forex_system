<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WelcomePage extends BaseModel {

    protected $table = 'welcome_page';

    protected $guarded = ['id'];

    protected $hidden = [
        'updated_at'
    ];


    public function user() {
        return $this->belongsTo('App\User');
    }
}
