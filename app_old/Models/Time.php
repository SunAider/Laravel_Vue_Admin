<?php

namespace App\Models;

use Dyrynda\Database\Support\CascadeSoftDeletes;
use Illuminate\Database\Eloquent\SoftDeletes;

class Time extends BaseModel
{
    use SoftDeletes;
    use CascadeSoftDeletes;

    protected $dates = ['deleted_at'];

    protected $fillable = [
        'hos_id',
        'time',
    ];
}
