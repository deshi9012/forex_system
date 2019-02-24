<?php

use Illuminate\Database\Seeder;
use App\Role;


class RolesTableSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {

        Role::create([
            'name'          => 'admin',
            'display_name'  => 'Admin Role',
            'description'   => 'This is Admin Role'
        ]);

        Role::create([
            'name'          => 'user',
            'display_name'  => 'User Role',
            'description'   => 'This is user role'
        ]);
        Role::create([
            'name'          => 'employee',
            'display_name'  => 'Employee Role',
            'description'   => 'This is employee in the system'
        ]);
    }
}
