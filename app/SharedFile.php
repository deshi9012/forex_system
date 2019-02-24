<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SharedFile extends Model {
    protected $table = 'shared_files';

    protected $guarded = [
        'id'
    ];
    protected $hidden = [
        'created_at',
        'updated_at'
    ];

}
