<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class History extends Model{

    protected $table = 'histories';

    protected $guarded = ['id'];

    public function user() {
        return $this->belongsTo('App\User');
    }
    protected $appends = [
        'before_data',
        'after_data'
    ];


    public function setBeforeDataAttribute($value) {
        $this->attributes['before_data'] = json_encode($value);
    }
    public function setAfterDataAttribute($value) {
        $this->attributes['after_data'] = json_encode($value);
    }
    public function getBeforeDataAttribute() {
        return json_decode($this->attributes['before_data'],true);
    }
    public function getAfterDataAttribute() {
        return json_decode($this->attributes['after_data']);
    }
    public function setCreatedAtAttribute(){
        $this->attributes['created_at'] = Carbon::now();
    }
    public function setUpdatedAtAttribute(){
        $this->attributes['updated_at'] = Carbon::now();
    }

}
