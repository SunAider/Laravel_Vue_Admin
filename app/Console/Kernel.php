<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use Illuminate\Support\Facades\DB;
use App\Models\FdState;
use Illuminate\Support\Facades\Log;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
    ];

    /**
     * Define the application's command schedule.
     *
     * @param \Illuminate\Console\Scheduling\Schedule $schedule
     */
    protected function schedule(Schedule $schedule)
    {
        // $schedule->command('inspire')->hourly();
        
        $schedule->call(function () {
            //fetch 都道府県 from DB by Postal code

            $get_data = 0;
            $url_wang = "https://fast-doctor-manager.herokuapp.com/api/web_statuses.json";
            $get_data_wang = Kernel::callAPI('GET', $url_wang, false);   
                     
            $url_online = "https://d3gg5npqfi8xtt.cloudfront.net/api/online_web_statuses.json";
            $get_data_online = Kernel::callAPI('GET', $url_online, false);  

            $states = FdState::get();
            $affected = DB::table('fd_states')->update(['wang' => $get_data_wang, 'online' => $get_data_online]);
            // if (empty($states)) {Log::info("BBBBBB", [ $states]);
            //   $affected = DB::table('fd_states')->insert(['wang' => $get_data_wang, 'online' => $get_data_online]);
            // } else {Log::info("CCCCC", [ $states]);
            //  $affected = DB::table('fd_states')->update(['wang' => $get_data_wang, 'online' => $get_data_online]);
            // }
            // if ($affected == 0) {
            //   $affected = DB::table('fd_states')->insert(['wang' => $get_data]);
            //   $affected = 0;
            // }
            // Log::error("C", [$affected]);
            
        })->everyMinute();
      //   $schedule->exec('echo "Happy New Year!" ')->everyMinute()->appendOutputTo('schedule_history.txt');
    }

    /**
     * Register the commands for the application.
     */
    protected function commands()
    {
        $this->load(__DIR__ . '/Commands');

        require base_path('routes/console.php');
    }
    
    /*
    * PHP CURL Funtion Template
    * Reference link: https://weichie.com/blog/curl-api-calls-with-php/
    */
    public function callAPI($method, $url, $data) {
      $curl = curl_init();
      switch ($method){
         case "POST":
            curl_setopt($curl, CURLOPT_POST, 1);
            if ($data)
               curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
            break;
         case "PUT":
            curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "PUT");
            if ($data)
               curl_setopt($curl, CURLOPT_POSTFIELDS, $data);                             
            break;
         default:
            if ($data)
               $url = sprintf("%s?%s", $url, http_build_query($data));
      }
      // OPTIONS:
      curl_setopt($curl, CURLOPT_URL, $url);
      curl_setopt($curl, CURLOPT_HTTPHEADER, array(
         'X-Api-Version:2',
         'Content-Type: application/json',
      ));
      curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
      curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
      // EXECUTE:
      $result = curl_exec($curl);
      if(!$result){die("Connection Failure");}
      curl_close($curl);
      return $result;
  }    
}
