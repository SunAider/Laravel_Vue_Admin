<?php

namespace App\Repositories;

use App\Models\Time;

class TimeRepository
{
    protected $model;

    public function __construct(Time $model)
    {
        $this->model = $model;
    }
    /**
     * 時間帯 一覧取得
     *
     * @param string|null $keyword
     * @param string $sortKey
     * @param string $orderBy
     * @return object
     */
    public function fetchTimeList(?string $keyword, string $sortKey, string $orderBy): object
    {
        $query = $this->model
                ->leftJoin('hospitals', 'times.hos_id', 'hospitals.id')
                ->select(
                    'times.id',
                    'hos_id',
                    'hos_name',
                    'tag_id',
                    'time',
                )
                ->get();
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
     * 時間帯 詳細情報取得
     */
    public function showWithTime($id): object
    {
        return $this->model->find($id);
    }

    /**
     * 時間帯 新規登録
     */
    public function storeWithTime($request)
    {
        return $this->model->storeData(collect($request));
    }

    /**
     * 時間帯 更新取得
     */
    public function updateWithTime($request, $id)
    {
        return $this->model->updateData($id, collect($request));
    }

    /**
     * 時間帯 削除
     */
    public function destroyWithTime(int $id)
    {
        return $this->model->deleteData($id);
    }
}
