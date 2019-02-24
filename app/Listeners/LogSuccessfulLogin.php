<?php

namespace App\Listeners;

use Illuminate\Http\Request;
use Illuminate\Auth\Events\Login;
use Illuminate\Http\Response;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Cookie;

class LogSuccessfulLogin {
    /**
     * Create the event listener.
     *
     * @return void
     */
    private $request;
    private $response;
    private $cookieJar;

    public function __construct(Request $request) {
        $this->request = $request;
    }

    /**
     * Handle the event.
     *
     * @param  Login $event
     */
    public function handle(Login $event) {
        if ($this->request->hasCookie('username') == null){
            Cookie::queue('username', $event->user['username'], 60);
        }
    }
}
