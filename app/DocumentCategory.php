<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\SoftDeletes;

class DocumentCategory extends BaseModel {


    protected $table = 'document_categories';

    protected $fillable = [
        'name'
    ];

    public function documents() {
        return $this->belongsToMany('App\Document','document_category_document');
    }
}
