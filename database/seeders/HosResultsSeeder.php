<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class HosResultsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $records = [
            [1,'hos_bbb',10,20,30,40],
            [2,'example_CCC',1,2,3,4],
        ];

        foreach ($records as $record) {
            $id = $record[0];
            // $exists = DB::table('hosresults')->where('id', $id)->exists();

            // if (!$exists) {
                DB::table('hosresults')->insert([
                    'id' => $id,
                    'tag_id' => $record[1],
                    'pcNum1' => $record[2],
                    'pcNum2' => $record[3],
                    'spNum1' => $record[4],
                    'spNum2' => $record[5],
                ]);
            // }
        }
    }
}
