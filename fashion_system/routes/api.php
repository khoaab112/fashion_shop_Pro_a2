<?php

use App\Http\Controllers\Admin\StaffController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\TypeTicketController;
use App\Http\Controllers\Authentication\AuthnController;
use App\Http\Controllers\Admin\BranchController;
use App\Http\Controllers\Admin\TypeReportController;
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
Route::middleware(['checkURL'])->group(function () {
    Route::middleware('checkDB')->group(function () {
        Route::group([
            // 'middleware' => 'api',
            'middleware' => ['api', 'auth:api'],
            'prefix' => 'auth'
        ], function () {
            //authentication administration
            Route::post('/login', [AuthnController::class, 'login'])->withoutMiddleware(['auth:api']);
            Route::post('/register', [AuthnController::class, 'register'])->withoutMiddleware(['auth:api']);
            Route::put('/change-password', [AuthnController::class, 'changePassword']);
            Route::post('/decodeJwt', [AuthnController::class, 'decode']);
            Route::delete('/logout', [AuthnController::class, 'logout']);
            //test
            Route::post('/test-login', [AuthnController::class, 'test']);
            Route::get('/test', [Test::class, 'index'])->withoutMiddleware(['auth:api']);

            //staff
            Route::get('/staff/{id}', [StaffController::class, 'getInFoStaff']);
            Route::put('/update-info-staff', [StaffController::class, 'updateInfo']);
            Route::post('/avatar-staff/{id}', [StaffController::class, 'changeAvatarStaffById']);
            Route::post('/background-staff/{id}', [StaffController::class, 'changeBackgroundStaffById']);

            //branch
            Route::get('/branch/{id}', [BranchController::class, 'getBranchById']);

            //type-report
            Route::post('/type-reports', [TypeReportController::class, 'createsTypeReport']);
            Route::get('/type-reports', [TypeReportController::class, 'getRecords']);

        });
    });
});

//login
//Accept= application/json
