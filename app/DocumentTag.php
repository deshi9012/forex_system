<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class DocumentTag extends BaseModel {

    use SoftDeletes;
    protected $table = 'document_tags';

    protected $fillable = [
        'name'
    ];

    public function documents() {
        return $this->belongsToMany('App\Document');
    }
}
