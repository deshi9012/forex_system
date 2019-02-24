<?php

namespace App;

use Carbon\Carbon;
use App\Traits\HistoryTrait;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Hash;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Sofa\Eloquence\Eloquence;

use Zizaco\Entrust\Traits\EntrustUserTrait;

class User extends Authenticatable {

    use Notifiable;
    use EntrustUserTrait;
    use SoftDeletes {
        SoftDeletes::restore insteadof EntrustUserTrait;
    }
	use Eloquence {
		Eloquence::save insteadof EntrustUserTrait;
	}

	use HistoryTrait;

    public static function boot(){
        parent::boot();


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


    protected $searchableColumns = [
		'id',
		'first_name',
		'last_name',
		'email'
	];

    protected $fillable = [
        'title',
        'first_name',
        'last_name',
        'username',
        'phone_personal',
        'phone_office',
        'salary',
        'last_login',
        'position_id',
        'superior_id',
        'email',
        'timezone_id',
        'work_week',
        'email_personal',
        'password',
        'avatart'
    ];

    protected $hidden = ['password', 'remember_token',];

    protected $appends = ['full_name','avatar'];

    public function setCreatedAtAttribute(){
        $this->attributes['created_at'] = Carbon::now();
    }

    public function setPasswordAttribute($value) {
        $this->attributes['password'] = Hash::make($value);
    }
    public function setSuperiorIdAttribute($value) {
        if(empty($value)){
            $this->attributes['superior_id'] = null;
        }else{
            $this->attributes['superior_id'] = $value;
        }
    }

    public function roles() {
        return $this->belongsToMany('App\Role');
    }
    public function histories() {
        return $this->hasMany('App\History');
    }
    public function welcomePages() {
        return $this->hasMany('App\WelcomePage');
    }

    public function position() {
        return $this->belongsTo('App\Position');
    }

    public function subordinate() {
        return $this->hasMany('App\User', 'superior_id', 'id');
    }

    public function superior() {
        return $this->belongsTo('App\User', 'superior_id');
    }

    public function timezone() {
        return $this->belongsTo('App\Timezone');
    }

    public function getFullNameAttribute() {
        return $this->attributes['first_name'].' '.$this->attributes['last_name'];
    }

    public function getAvatarAttribute() {

        if($this->attributes['avatar'] == null) {
            return 'storage' . config('filesystems.disks.avatars.url') . 'user-icon.svg';
        }

        return 'storage' . config('filesystems.disks.avatars.url') . $this->attributes['avatar'];
//        if (isset($this->attributes['avatar'])) {
//
//
//            $avatar = '/storage/avatars/' . $this->attributes['avatar'];
//
//        } else {
//            $avatar = '/storage/avatars/user-icon.svg';
//        }
//        return   $avatar;

    }
}
