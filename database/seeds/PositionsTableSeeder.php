<?php
use Illuminate\Database\Seeder;
use App\Position;
class PositionsTableSeeder extends Seeder {

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        Position::create([
            'name'           => 'CEO',
            'description'    => 'CEO of company',
        ]);
        Position::create([
            'name'           => 'Marketer',
            'description'    => 'This is marketer',
        ]);
        Position::create([
            'name'           => 'Employee',
            'description'    => 'This is employee',
        ]);
        Position::create([
            'name'           => 'hr',
            'description'    => 'HR position',
        ]);
    }
}
