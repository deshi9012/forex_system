<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Timezone;

class TimezoneController extends ApiController {

    public function index() {
        $timezones = Timezone::all();

        return $this->respond($timezones);
    }
}
