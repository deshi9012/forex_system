<?php

use App\Timezone;
use Illuminate\Database\Seeder;

class TimezonesTableSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */

    private function time_zonelist() {
        $timezones = [];
        $timezone_identifiers_list = timezone_identifiers_list();
        foreach ($timezone_identifiers_list as $timezone_identifier) {
            $date_time_zone = new DateTimeZone($timezone_identifier);
            $date_time = new DateTime('now', $date_time_zone);
            $hours = floor($date_time_zone->getOffset($date_time) / 3600);
            $mins = floor(($date_time_zone->getOffset($date_time) - ($hours * 3600)) / 60);
            $hours = 'GMT' . ($hours < 0 ? $hours : '+' . $hours);
            $mins = ($mins > 0 ? $mins : '0' . $mins);
            $text = str_replace("_", " ", $timezone_identifier);
            $timezones[$timezone_identifier] = $text . ' (' . $hours . ':' . $mins . ')';
        }
        return $timezones;
    }
    public function run() {

        $timezones  = $this->time_zonelist();

        foreach ($timezones as $timezone) {
            Timezone::create([
               'timezone' => $timezone
            ]);
        }
    }
}
