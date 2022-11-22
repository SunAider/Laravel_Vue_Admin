<?php

use Illuminate\Support\Facades\Storage;

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

// Route::get("/pub/{fileName}", function($fileName) {
//     // return "ssss";
//     // var_dump(storage_path());
//     // var_dump("aaaaa");
//     // return Storage::download($fileName);
//     //string(34) "/var/www/html/MiddleServer/storage" string(5) "aaaaa"
//     // $path = storage_path().'/'.'tag/'.$fileName;
//     // if (file_exists($path)) {
//     //     return Response::file($path);
//     // }
//     $path = 'tag/'.$fileName;
//     // var_dump($path);
//     if (file_exists($path)) {
//         $response = file_get_contents(Response::file($path));
//         return $response->header('Content-Type', 'application/javascript');
//     }
// });

Route::get('/{any?}', function () {
    return view('index');
})->where('any', '.+');
