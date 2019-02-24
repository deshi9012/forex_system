<?php

namespace App;

use Auth;
use Log;
use Sofa\Eloquence\Eloquence;
use Zizaco\Entrust\EntrustPermission;

class Permission extends EntrustPermission {
	use Eloquence;

	protected $searchableColumns = [
	    'id',
        'name'
    ];

    protected $table = 'permissions';

    protected $fillable = [
        'name',
        'display_name',
        'additional_rights',
        'description'
    ];
    protected $appends = ['additional_rights'];
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

    public function getAdditionalRightsAttribute() {

        return json_decode($this->attributes['additional_rights'],true);
    }

    public function roles() {
        return $this->belongsToMany('App\Role');
    }
}
