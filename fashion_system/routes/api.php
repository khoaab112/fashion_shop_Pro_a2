<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\TypeTicketController;
use App\Http\Controllers\Authentication\AuthnController;

use App\Http\Controllers\Test;
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

// Route::get('/test', [TypeTicketController::class, 'Text']);
// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
Route::middleware('checkURL')->group(function () {
    Route::middleware('checkDB')->group(function () {
        Route::group([
            // 'middleware' => 'api',
            'middleware' => ['api', 'auth:api'],
            'prefix' => 'auth'
        ], function () {
            Route::post('/login', [AuthnController::class, 'login'])->withoutMiddleware(['auth:api']);
            Route::post('/register', [AuthnController::class, 'register'])->withoutMiddleware(['auth:api']);
            Route::post('/decodeJwt', [AuthnController::class, 'decode']);
            Route::delete('logout',[AuthnController::class, 'logout'] );
                
            Route::post('/test-login', [AuthnController::class, 'test']);
            Route::get('/test', [Test::class, 'index'])->withoutMiddleware(['auth:api']);
            Route::get('/get-users', [AuthnController::class, 'getAll']);
        });
    });
});

//login
//Accept= application/json
