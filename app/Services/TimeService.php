<?php

namespace App\Services;

use App\Enums\HttpStatus;
use App\Repositories\TimeRepository;

class TimeService
{
    protected $repository;

    public function __construct(TimeRepository $repository)
    {
        $this->repository = $repository;
    }
    /**
     * 時間帯 一覧取得
     *
     * @param ?string $keyword
     * @param string $sortKey
     * @param string $orderBy
     * @return object
     */
    public function fetchTimeList(?string $keyword, string $sortKey, string $orderBy): object
    {
        return $this->repository->fetchTimeList($keyword, $sortKey, $orderBy);
    }

    /**
     * 時間帯 詳細情報取得
     */
    public function showWithTime($id): object
    {
        return $this->repository->showWithTime($id);
    }

    /**
     * 時間帯 新規登録
     */
    public function storeWithTime($request)
    {
        $city = $this->repository->storeWithTime($request);
        return response()->json($city, HttpStatus::CREATED);
    }

    /**
     * 時間帯 更新
     */
    public function updateWithTime($id, $request)
    {
        return $this->repository->updateWithTime($id, $request);
    }

     /**
     * 時間帯 削除
     */
    public function destroyWithTime(int $id): void
    {
        $this->repository->destroyWithTime($id);
    }
}
