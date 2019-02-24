<?php

namespace App\Traits;

use App\History;
use Auth;
use Exception;
use Log;

trait HistoryTrait {

    public $isRestore = false;

	static $ignoreFields = ['updated_at', 'created_at', 'remember_token'];

	public static function checkChanges($before, $after, $ignore = []) {

	    $differences = array_diff($before, $after);

		foreach ($ignore as $key) {
			unset($differences[$key]);
		}
        
		return $differences ? true : false;
	}

	public static function logData($model, $eventType) {

		if(!Auth::user()){
			Log::debug('No user, no log');
			return;
		}

        if($eventType == 'update') {

            //Should we log this event?
            if (!self::checkChanges($model->original, $model->attributes, self::$ignoreFields)) {
                Log::debug('Nothing to log right now');
                return;
            }
        }

        if($model->isRestore) {
            Log::debug('We are restoring');
            $eventType = 'restore';
        }

		$nameOfClass = get_class($model);

		//Find position of last slash ex. App\Models"\"User
		$posOfLastSlash = strripos($nameOfClass,"\\");

		$result = substr($nameOfClass,$posOfLastSlash+1);

		$data = [];
		$data['user_id']        = Auth::user()->id;
		$data['before_data']    = $model->original;
		$data['after_data']     = $model->attributes;
		$data['section']        = $result;
		$data['event_type']     = $eventType;
		$data['item_id']        = $model->attributes['id'];

        if($eventType == 'delete'){
            $data['after_data'] = [];
        }

		self::saveData($data);

	}

	public static function saveData ($data) {
		try{
			History::create($data);
		}catch (Exception $e){
			Log::error($e);
		}
	}
}