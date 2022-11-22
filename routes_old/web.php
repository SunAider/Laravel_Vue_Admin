<?php

Route::get('/boat/{prefectureParam}', function ($prefectureParam) {
    return view('boatlist', compact('prefectureParam'));
})->name('boatlist');

Route::get('/boat/{prefectureParam}/{cityParam}', function ($prefectureParam, $cityParam) {
    return view('boatlist', compact('prefectureParam', 'cityParam'));
})->name('boatlist');

Route::get('/boat/{prefectureParam}/{cityParam}/{portParam}', function ($prefectureParam, $cityParam, $portParam) {
    return view('boatlist', compact('prefectureParam', 'cityParam', 'portParam'));
})->name('boatlist');

Route::get('/boat/{prefectureParam}/{cityParam}/{portParam}/{boatId}', function ($prefectureParam, $cityParam, $portParam, $boatId) {
    return view('boatdetail', compact('prefectureParam', 'cityParam', 'portParam', 'boatId'));
})->name('boatdetail');

Route::get('/{any?}', function () {
    return view('index');
})->where('any', '.+');
