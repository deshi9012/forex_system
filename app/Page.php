<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;

class Page extends BaseModel {
    use SoftDeletes;

    protected $table = 'pages';


    protected $appends = ['hour','date'];


    protected $fillable = [
        'name', 'content', 'description'
    ];

    public function categories() {
        return $this->belongsToMany('App\PageCategory');
    }

    public function tags() {
        return $this->belongsToMany('App\PageTag');
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
