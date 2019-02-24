<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;
class Document extends BaseModel {
    use SoftDeletes;

    protected $table = 'documents';

	protected $fillable = [
		'name', 'content', 'description'
	];
    protected $appends = ['hour','date'];

    public function categories() {
        return $this->belongsToMany('App\DocumentCategory','document_category_document');
    }

    public function tags() {
        return $this->belongsToMany('App\DocumentTag');
    }


    public function getDateAttribute(){

        return Carbon::parse($this->attributes['created_at'])->toFormattedDateString();                 // Dec 25, 1975

    }

    public function getHourAttribute() {

        if(Carbon::parse($this->attributes['created_at'])->minute < 10){
            return Carbon::parse($this->attributes['created_at'])->hour . ':0'. Carbon::parse($this->attributes['created_at'])->minute;
        }
        return Carbon::parse($this->attributes['created_at'])->hour . ':'. Carbon::parse($this->attributes['created_at'])->minute;
    }
}