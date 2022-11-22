<?php

namespace App\Repositories;

use App\Models\Lender;
use App\Models\Boat;
use App\Models\User;

use App\Enums\Util;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

use App\Enums\RoleId;

// use PDOException;

class LenderRepository
{
    protected $model;
    protected $boat;
    protected $user;
    protected $util;

    public function __construct(Lender $model, Boat $boat, User $user)
    {
        $this->model = $model;
        $this->boat = $boat;
        $this->user = $user;
    }
    /**
     * 一覧取得
     *
     * @param string|null $keyword
     * @param string $sortKey
     * @param string $orderBy
     * @return object
     */

    public function storeAdmin($Request)
    {
        return  $this->user->storeData(collect($Request));
    }
    
    public function fetchAdmin(?string $keyword, string $sortKey, string $orderBy): object
    {
        // TODO: ->whereNull('users.deleted_at')
        
        $query = $this->user
            ->whereNull('deleted_at')
            ->whereIn('role_id', [RoleId::ADMIN, RoleId::subADMIN])
            ->orderBy('id', 'asc')->paginate(Util::PAGINATE_COUNT);
        Log::info("Save subAdmin Data on Repository", [$query]);
        
        return $query;
    }
    /**
     * リスト取得
     */
    public function fetchLenderList()
    {
        return $this->model->get();
    }
    /**
     * 貸船業者 新規作成
     */
    public function storeLender($lenderRequest)
    {
        Log::info("Save subAdmin Data on Repository", [$lenderRequest]);
        return  $this->model->storeData(collect($lenderRequest));
    }

    /**
     * 貸船業者/船 詳細取得
     */
    public function fetchAdminDetail($id): object
    {
        return $this->user->find($id);
    }
    /**
     * 貸船業者/船 更新
     */
    public function updateLender($id, $lenderRequest)
    {
        Log::info("update Admin", [$lenderRequest]);
        return  $this->user->updateData($id, collect($lenderRequest));
    }
    /**
     * 貸船業者/船 削除
     */
    public function deleteLender($id)
    {
        return $this->user->deleteData($id);
    }
}
