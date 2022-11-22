<?php

use App\Http\Controllers\HospitalController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['middleware' => 'auth:sanctum'], function () {
    Route::resource('hospitals', HospitalController::class)->only([
        'index',
        'show',
        'store',
        'update',
        'destroy',
    ]);
    Route::get('hospitals/list', [HospitalController::class, 'fetchHospitalList']);
});

Route::get('/validPopup', [HospitalController::class, 'validPopup']);
Route::get('/popupClicked', [HospitalController::class, 'popupClicked']);