<?php

use App\Events\CreateUser;
use App\Timezone;
use Illuminate\Database\Seeder;
use App\User;
use App\Position;
use Carbon\Carbon;
use App\Role;

class UsersTableSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    //
    public function run() {

        $roles = Role::pluck('id');
        $last = count($roles) - 1;

        $user = User::create([
            'title'             => 'Mr.',
            'first_name'        => 'Ilia',
            'last_name'         => 'Bojadzhiev',
            'username'          => 'admin',
            'email'        => 'ilia@startupmasters.eu',
            'email_personal'    => 'ilia@startupmasters.eu',
            'salary'            => 1000.00,
            'position_id'       => 1,
            'timezone_id'       => Timezone::orderByRaw('RAND()')->first()->id,
            'password'          => '123qwe'
        ]);

	    event(new CreateUser($user));

        if (count($roles)) {
            $user->roles()->attach($roles[rand(0, $last)]);
        }

        $user = User::create([
            'title'             => 'Mr.',
            'first_name'        => 'Alexander',
            'last_name'         => 'Alexiev',
            'username'          => 'employee',
            'email'        => 'ilia1@startupmasters.eu',
            'email_personal'    => 'ilia@2startupmasters.eu',
            'salary'            => 1000.00,
            'position_id'       => 2,
            'superior_id'       => 1,
            'timezone_id'       => Timezone::orderByRaw('RAND()')->first()->id,
            'password'          => '123qwe'
        ]);
        if (count($roles)) {
            $user->roles()->attach($roles[rand(0, $last)]);
        }

	    event(new CreateUser($user));

        $faker = Faker\Factory::create();
        $limit = 33;

        for ($i = 0; $i < $limit; $i++) {
            $user = User::create([
                'title'             => $faker->title(),
                'first_name'        => $faker->firstName(),
                'last_name'         => $faker->lastName(),
                'username'          => $faker->userName(),
                'password'          => '123qwe',
                'phone_personal'    => $faker->phoneNumber(),
                'phone_office'      => $faker->phoneNumber(),
                'email'        => $faker->email(),
                'email_personal'    => $faker->companyEmail(),
                'salary'            => 1000,
                'position_id'       => 3,
                'superior_id'       => User::orderByRaw('RAND()')->first()->id,
                'timezone_id'       => Timezone::orderByRaw('RAND()')->first()->id,
                'created_at'        => Carbon::now()
            ]);

	        event(new CreateUser($user));

            if (count($roles)) {
                $user->roles()->attach($roles[rand(0, $last)]);
            }
        }
    }
}
