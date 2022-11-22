<?php

namespace App\Repositories;
use DB;
use App\Models\Hospital;


class HospitalRepository
{
    protected $model;

    public function __construct(Hospital $model)
    {
        $this->model = $model;
    }
    /**
     * 一覧取得
     *
     * @param string|null $keyword
     * @param string $sortKey
     * @param string $orderBy
     * @return object
     */
    public function fetchHospital(?string $keyword, string $sortKey, string $orderBy): object
    {
        $query = $this->model->get();
        //     ->select(
        //     );

        // // if ($keyword) {
        // //     $keywordArray = explode(',', $keyword);
        // //     $query = $query->where(function ($query) use ($keywordArray) {
        // //         foreach ($keywordArray as $word) {
        // //             if (!empty($word)) {
        // //                 $k = '%'.$word.'%';
        // //                 $query->where(function ($q) use ($k) {
        // //                     $q->orWhere('users.name', 'like', $k)
        // //                         ->orWhere('boats.boat_name', 'like', $k);
        // //                 });
        // //             }
        // //         }
        // //     });
        // // }
        return $query;
        // return $query->orderBy($sortKey, $orderBy)->paginate(Util::PAGINATE_COUNT);

    }

    /**
     * 病院 詳細情報取得
     */
    public function showWithHos($id): object
    {
        return $this->model->find($id);
    }

    /**
     * 病院 新規登録
     */
    public function storeWithHos($request)
    {
        return $this->model->storeData(collect($request));
    }

    /**
     * 病院 更新取得
     */
    public function updateWithHos($request, $id)
    {
        return $this->model->updateData($id, collect($request));
    }

    /**
     * 病院 削除
     */
    public function destroyWithHos(int $id)
    {
        return $this->model->deleteData($id);
    }

    public function validPopup($tag_id)
    {       
        /* 
        *get available times from DB  
        */
        $hos_id = DB::table('hospitals')->where('tag_id', $tag_id)->get('id');
        $hos_id = json_decode($hos_id, true);
        $times = DB::table('times')->where('hos_id',  $hos_id[0])->get(); 
        /*
         * get status of FD site by PHP CURL API
         */
        // $url = "https://quotes.rest/qod.json/";
        // $get_data = HospitalRepository::callAPI('GET', $url, false);
        $get_data = $times;
        $response = json_decode($get_data, true);

        $currentTime = gettimeofday();
        // return $currentTime;
        return $response[0]['time'];
    }

    public function popupClicked($tag_id)
    {       
        /* 
        *get available times from DB  
        */
        // return "dd";
        $times = DB::table('hospitals')->where('hos_id', $tag_id)->get(); 
        // return $times;

        $currentTime = gettimeofday();
        return $currentTime;
    }

    /*
    * PHP CURL Funtion Template
    * Reference link: https://weichie.com/blog/curl-api-calls-with-php/
    */
    public function callAPI($method, $url, $data){
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
           'APIKEY: 111111111111111111111',
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
