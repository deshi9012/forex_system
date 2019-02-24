<?php

use Illuminate\Database\Seeder;
use App\Page;
use Carbon\Carbon;

class PagesTableSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */

    public function run() {
        $faker = Faker\Factory::create();
        $limit = 33;

        $faker = Faker\Factory::create();
        $limit = 33;

        for ($i = 0; $i < $limit; $i++) {
            Page::create([
                'name'          => $faker->sentence(),
                'content'       => $faker->paragraph(),
                'description'   => $faker->sentence(),
                'created_at'    => Carbon::now()
            ]);
        }
    }
}
