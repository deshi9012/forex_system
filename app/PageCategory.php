<?php

namespace App;

use Faker\Provider\Base;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PageCategory extends BaseModel {
    use SoftDeletes;
    protected $table = 'page_categories';

    protected $fillable = [
        'name'
    ];

    public function pages() {
        return $this->belongsToMany('App\Page');
    }
}
