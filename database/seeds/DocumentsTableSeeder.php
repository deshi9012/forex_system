<?php

use Illuminate\Database\Seeder;
use App\Document;
use Carbon\Carbon;
class DocumentsTableSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {

        $faker = Faker\Factory::create();
        $limit = 33;

        for ($i = 0; $i < $limit; $i++) {

         Document::create([
                'name'          => $faker->sentence(),
                'content'       => $faker->paragraph(),
                'description'   => $faker->sentence(),
                'created_at'    => Carbon::now()
            ]);

        }
    }
}
