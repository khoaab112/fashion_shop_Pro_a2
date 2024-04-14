<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Authentication\AuthenticationCustomersController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware(['checkURL', 'cors'])->group(function () {
    Route::middleware('checkDB')->group(function () {
        Route::group([
            'middleware' => ['api_web', 'auth:api_web'],
            'prefix' => 'web'
        ], function () {
            //staff Account
            Route::post('/login', [AuthenticationCustomersController::class, 'login'])->withoutMiddleware(['auth:api_web']);
            Route::post('/register', [AuthenticationCustomersController::class, 'register'])->withoutMiddleware(['auth:api']);
            Route::put('/reissue-password', [AuthenticationCustomersController::class, 'reissuePassword'])->withoutMiddleware(['auth:api']);
            Route::delete('/logout', [AuthenticationCustomersController::class, 'logout']);
        });
    });
});

//login
//Accept= application/json
