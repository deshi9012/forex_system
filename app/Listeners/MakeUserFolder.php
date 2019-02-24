<?php

namespace App\Listeners;

use App\Events\CreateUser;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Storage;


class MakeUserFolder {
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct() {

    }

    /**
     * Handle the event.
     *
     * @param  CreateUser $event
     * @return void
     */
    public function handle(CreateUser $event) {

        Storage::disk('users')->makeDirectory($event->user->id);
	    Storage::disk('users')->makeDirectory($event->user->id . '/hr');
	    Storage::disk('users')->makeDirectory($event->user->id . '/personal');
	    Storage::disk('users')->makeDirectory($event->user->id . '/agreements');
	    Storage::disk('users')->makeDirectory($event->user->id . '/headshots');
	    Storage::disk('users')->makeDirectory($event->user->id . '/salaries');
	    Storage::disk('users')->makeDirectory($event->user->id . '/evaluations');
	    Storage::disk('users')->makeDirectory($event->user->id . '/firing documentations');
    }
}
