<?php

namespace App\Http\Controllers;

use App\Enums\Util;
use Illuminate\Http\Request;
use App\Http\Requests\HosRequest;
use App\Services\HosResultService;

class HosResultController extends Controller
{
    protected $service;

    public function __construct(HosResultService $service)
    {
        $this->service = $service;
    }

    /**
     * 病院一覧取得
     *
     * @authenticated
     * @group Hospital
     * @param Request $request
     * @return object
     */
    public function index(Request $request): object
    {
        $keyword = $request->get('keyword');
        $startTime = $request->get('startTime');
        $endTime = $request->get('endTime');
        $sortKey = $request->get('sort_key');
        $orderBy = $request->get('order_by');
        $raw = $request->get('raw');
        // return "bbb";
        // $data['result'] = "bbb";
        // return response()->json($data, 200);
        return $this->service->fetchHosResult($keyword, $startTime, $endTime, $sortKey, $orderBy, $raw);
    }

    /**
     * 病院 詳細情報取得
     *
     * @param Request $request
     * @return object
     */
    public function show($id): object
    {
        return $this->service->showWithHos($id);
    }


    /**
     * 病院 新規登録
     *
     * @param Request $request
     * @return void
     */
    public function store(HosRequest $request)
    {
        return $this->service->storeWithHos($request);
    }

     /**
     * 病院 更新
     *
     * @param Request $request
     * @param int $id
     * @return void
     */
    public function update(HosRequest $request, int $id)
    {
        return $this->service->updateWithHos($request, $id);
    }

    /**
     * 病院 削除
     * @param Request $request
     * @param  int  $id
     */
    public function destroy($id)
    {
        return $this->service->destroyWithHos($id);
    }

    public function validPopup(Request $request)
    {
        $tag_id = $request->get('tag_id');
        // return $tag_id;
        return $this->service->validPopup($tag_id);
    }

    public function popupClicked(Request $request)
    {
        $tag_id = $request->get('tag_id');
        // return $tag_id;
        return $this->service->popupClicked($tag_id);
    }
}
