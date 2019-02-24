<?php

use Illuminate\Database\Seeder;
use App\DocumentCategory;
use Carbon\Carbon;

class DocumentCategoriesTableSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(){
        $faker = Faker\Factory::create();
        $limit = 33;

        $faker = Faker\Factory::create();
        $limit = 33;

        for ($i = 0; $i < $limit; $i++) {
            DocumentCategory::create([
                'name'          => $faker->word(),
                'created_at'    => Carbon::now()
            ]);
        }
    }
}
