<?php

namespace App;

use Auth;
use Log;
use Zizaco\Entrust\EntrustRole;

class Role extends EntrustRole {

    protected $table = 'roles';

    protected $fillable = [
        'name',
        'display_name',
        'description'
    ];

    protected $hidden = [
        'created_at',
        'updated_at'
    ];
    public static function boot(){
        parent::boot();


        static::deleted(function ($model){

	        if(!Auth::user()){
		        Log::debug('No user, no log');
		        return;
	        }

            $nameOfClass = get_class($model);

            //Find position of last slash ex. App\Models"\"User
            $posOfLastSlash = strripos($nameOfClass,"\\");

            $result = substr($nameOfClass,$posOfLastSlash+1);

            $data = [];
            $data['user_id']        = \Auth::user()->id;
            $data['before_data']    = $model->attributes;
            $data['after_data']     = '';
            $data['section']        = $result;
            $data['event_type']     = 'delete';
            $data['item_id']        = $model->attributes['id'];


            try{
                History::create($data);
            }catch (Exception $e){
                Log::error($e);
            }
        });

        static::updated(function ($model){

	        if(!Auth::user()){
		        Log::debug('No user, no log');
		        return;
	        }

            $nameOfClass = get_class($model);

            //Find position of last slash ex. App\Models"\"User
            $posOfLastSlash = strripos($nameOfClass,"\\");

            $result = substr($nameOfClass,$posOfLastSlash+1);

            $data = [];
            $data['user_id']        = \Auth::user()->id;
            $data['before_data']    = $model->original;
            $data['after_data']     = $model->attributes;
            $data['section']        = $result;
            $data['event_type']     = 'update';
            $data['item_id']        = $model->attributes['id'];


            try{
                History::create($data);
            }catch (Exception $e){
                Log::error($e);
            }

        });
        static::created(function ($model){

	        if(!Auth::user()){
		        Log::debug('No user, no log');
		        return;
	        }

            $nameOfClass = get_class($model);

            //Find position of last slash ex. App\Models"\"User
            $posOfLastSlash = strripos($nameOfClass,"\\");

            $result = substr($nameOfClass,$posOfLastSlash+1);

            $data = [];
            $data['user_id']        = \Auth::user()->id;
            $data['before_data']    = $model->original;
            $data['after_data']     = $model->attributes;
            $data['section']        = $result;
            $data['event_type']     = 'create';
            $data['item_id']        = $model->attributes['id'];


            try{
                History::create($data);
            }catch (Exception $e){
                Log::error($e);
            }

        });

    }

    public function permissions() {
        return $this->belongsToMany('App\Permission');
    }

    public function users() {
        return $this->belongsToMany('App\User');
    }
}
