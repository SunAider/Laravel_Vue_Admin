<?php

namespace App\Services;

use App\Enums\HttpStatus;
use App\Repositories\HosResultRepository;

class HosResultService
{
    protected $repository;

    public function __construct(HosResultRepository $repository)
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
    public function fetchHosResult(?string $keyword, string $startTime, string $endTime, string $sortKey, string $orderBy): object
    {
        return $this->repository->fetchHosResult($keyword, $startTime, $endTime, $sortKey, $orderBy);
    }
    
}
