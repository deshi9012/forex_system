<?php

namespace App;

use Exception;
use Illuminate\Database\Eloquent\Model;
use Log;
use App\Traits\HistoryTrait;


class BaseModel extends Model {

    use HistoryTrait;

    public static function boot(){
        parent::boot();


//        static::updating(function ($model){
//           dd($model);
//        });

        static::deleted(function ($model){

            self::logData($model, 'delete');

        });

        static::updated(function ($model){

            self::logData($model, 'update');

        });
        static::created(function ($model){

            self::logData($model, 'create');

        });

    }
//
}