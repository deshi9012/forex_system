<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        $this->call(DocumentsTableSeeder::class);
        $this->call(DocumentTagsTableSeeder::class);
        $this->call(DocumentCategoriesTableSeeder::class);

        $this->call(PagesTableSeeder::class);
        $this->call(PageCategoriesTableSeeder::class);
        $this->call(PageTagsTableSeeder::class);

        $this->call(PositionsTableSeeder::class);
        $this->call(RolesTableSeeder::class);

        $this->call(TimezonesTableSeeder::class);

        $this->call(UsersTableSeeder::class);

        $this->call(PermissionsTableSeeder::class);

    }
}
