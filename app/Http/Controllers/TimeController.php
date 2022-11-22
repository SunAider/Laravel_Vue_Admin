<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\TimeRequest;
use App\Services\TimeService;

class TimeController extends Controller
{
    protected $service;

    public function __construct(TimeService $service)
    {
        $this->service = $service;
    }

    /**
     * 時間帯 一覧取得
     *
     * @authenticated
     * @group Time
     * @param Request $request
     * @return object
     */
    public function index(Request $request): object
    {
        $keyword = $request->get('keyword');
        $sortKey = $request->get('sort_key');
        $orderBy = $request->get('order_by');
        return $this->service->fetchTimeList($keyword, $sortKey, $orderBy);
    }

    /**
     * 時間帯 詳細情報取得
     *
     * @param Request $request
     * @return object
     */
    public function show($id): object
    {
        return $this->service->showWithTime($id);
    }


    /**
     * 時間帯 新規登録
     *
     * @param Request $request
     * @return void
     */
    public function store(TimeRequest $request)
    {
        return $this->service->storeWithTime($request);
    }

     /**
     * 時間帯 更新
     *
     * @param Request $request
     * @param int $id
     * @return void
     */
    public function update(TimeRequest $request, int $id)
    {
        return $this->service->updateWithTime($request, $id);
    }

    /**
     * 時間帯 削除
     * @param Request $request
     * @param  int  $id
     */
    public function destroy($id)
    {
        return $this->service->destroyWithTime($id);
    }
}
