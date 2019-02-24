<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PageTag extends BaseModel {
    use SoftDeletes;

    protected $table = 'page_tags';

    protected $fillable = [
        'name'
    ];

    public function pages() {
        return $this->belongsToMany('App\Page');
    }
}
