<?php

namespace App\Repositories;
use DB;
use App\Models\HosResult;
use App\Enums\Util;
use Illuminate\Support\Facades\Log;


class HosResultRepository
{
    protected $model;

    public function __construct(HosResult $model)
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
    public function fetchHosResult(?string $keyword, string $startTime, string $endTime, string $sortKey, string $orderBy, string $raw): object
    {
        if ($raw == '0') {
            Log::info("raw", [$raw]);

            // $query = $this->model->get();
            $query = $this->model->whereBetween('click_date',[$startTime, $endTime])->orderBy($sortKey, $orderBy)->get();
            $tagIdQuery = $this->model->groupBy('tag_id')->get("tag_id");
            $result = [];
            foreach ($tagIdQuery as $tagRow) {
                $res['tag_id'] = $tagRow['tag_id'];
                $res['pcNum1'] = 0;
                $res['pcNum2'] = 0;
                $res['pcNum3'] = 0;
                $res['spNum1'] = 0;
                $res['spNum2'] = 0;              
                $res['spNum3'] = 0;              
                                    
                foreach ($query as $row) {
                    if ($row['tag_id'] == $res['tag_id']) {
                        switch ($row['click_type']) {
                            case '0':
                                $res['pcNum1']++;
                                break;                        
                            case '1':
                                $res['pcNum2']++;
                                break;
                            case '2':
                                $res['pcNum3']++;
                                break;
                            case '3':
                                $res['spNum1']++;
                                break;
                            case '4':
                                $res['spNum2']++;
                                break;
                            case '5':
                                $res['spNum3']++;
                                break;
                                
                            default:
                                break;
                        }
                    } 
                }
                array_push($result, $res);
            }
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
            
            // $result = array(
            //     'key' => $orderBy
            // // );
            // $result = array();
            // $result['key'] = $orderBy; //[{'key':val, 'key2':val2}]
            return response()->json($result, 200);
            // return $query->
            // return $result;
        } else if ($raw == '1') {
            Log::info("raw", ['raw is 1']);
            $query = $this->model->whereBetween('click_date',[$startTime, $endTime])->orderBy('tag_id', 'ASC')->orderBy('click_date', 'ASC')->orderBy('click_type', 'ASC')->get();
            // $tagIdQuery = $this->model->groupBy('tag_id')->get("tag_id");
            return response()->json($query, 200);
        }
        

    }

    /**
     * 病院 詳細情報取得
     */
    public function showWithHos($id): object
    {
        return $this->model->find($id);
    }
     
}
