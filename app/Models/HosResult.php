<?php

namespace App\Models;

use Dyrynda\Database\Support\CascadeSoftDeletes;
use Illuminate\Database\Eloquent\SoftDeletes;

class Hosresult extends BaseModel
{
    use SoftDeletes, CascadeSoftDeletes;

    protected $dates = ['deleted_at'];

    protected $fillable = [
        'tag_id',
        'pcNum1',
        'pcNum2',
        'spNum1',
        'spNum2',
        ];
}
