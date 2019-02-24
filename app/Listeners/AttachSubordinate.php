<?php

namespace App\Listeners;

use App\Events\UserWasDeleted;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class AttachSubordinate {
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
     * @param  UserWasDeleted $event
     * @return void
     */
    public function handle(UserWasDeleted $event) {
        //get superior of deleted user
        $superiorUser = $event->user->superior->id;

        //get subordinate of deleted user
        $subordinateUsers = $event->user->subordinate;

        //loop in all subordinates and attach the superiorUser
        foreach ($subordinateUsers as $subordinateUser) {
            $subordinateUser->superior->id = $superiorUser;
            $subordinateUser->save();
        }
    }
}
