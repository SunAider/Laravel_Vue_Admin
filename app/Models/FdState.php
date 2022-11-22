<?php

namespace App\Models;

use Dyrynda\Database\Support\CascadeSoftDeletes;
use Illuminate\Database\Eloquent\SoftDeletes;

class FdState extends BaseModel
{
    use SoftDeletes, CascadeSoftDeletes;

    protected $dates = ['deleted_at'];

    protected $fillable = [
        'id',
        'wang',
        'online',
        'closeAll',
        ];
    protected $table = 'fd_states';
}
