<?php

namespace App\Services;

use App\Enums\HttpStatus;
use App\Repositories\HospitalRepository;

class HospitalService
{
    protected $repository;

    public function __construct(HospitalRepository $repository)
    {
        $this->repository = $repository;
    }
    /**
     * 病院 一覧取得
     *
     * @param ?string $keyword
     * @param string $sortKey
     * @param string $orderBy
     * @return object
     */
    public function fetchHospital(?string $keyword, string $sortKey, string $orderBy): object
    {
        return $this->repository->fetchHospital($keyword, $sortKey, $orderBy);
    }

    /**
     * 病院 詳細情報取得
     */
    public function showWithHos($id): object
    {
        return $this->repository->showWithHos($id);
    }

    /**
     * 病院 新規登録
     */
    public function storeWithHos($request)
    {
        $city = $this->repository->storeWithHos($request);
        return response()->json($city, HttpStatus::CREATED);
    }

    /**
     * 病院 更新
     */
    public function updateWithHos($id, $request)
    {
        return $this->repository->updateWithHos($id, $request);
    }

     /**
     * 病院 削除
     */
    public function destroyWithHos(int $id): void
    {
        $this->repository->destroyWithHos($id);
    }

     //valid Popup
    public function validPopup($tag_id)
    {
        return $this->repository->validPopup($tag_id);
        // return "bb";
    }
    
    public function popupClicked($tag_id)
    {
        return $this->repository->popupClicked($tag_id);
    }
}
