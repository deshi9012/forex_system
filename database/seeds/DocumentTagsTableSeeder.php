<?php

use Illuminate\Database\Seeder;
use App\DocumentTag;
class DocumentTagsTableSeeder extends Seeder {
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
            DocumentTag::create([
                'name' => $faker->word(),
            ]);
        }
    }
}
