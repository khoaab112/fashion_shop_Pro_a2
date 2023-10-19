<?php

use App\Http\Controllers\Admin\StaffController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\TypeTicketController;
use App\Http\Controllers\Authentication\AuthnController;
use App\Http\Controllers\Admin\BranchController;
use App\Http\Controllers\Admin\TypeReportController;
use App\Http\Controllers\Admin\ReportSourceController;
use App\Http\Controllers\Admin\ReportsController;
use App\Http\Controllers\Broadcasting\FollowAccount\ManagerController;
use App\Http\Controllers\Admin\NotificationController;
use App\Http\Controllers\Admin\StaffAccountController;
use App\Http\Controllers\Admin\Administration;
use App\Http\Controllers\Admin\Position;

//test controller


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

            //staff
            Route::get('/staff/{id}', [StaffController::class, 'getInFoStaff']);
            Route::put('/update-info-staff', [StaffController::class, 'updateInfo']);
            Route::post('/avatar-staff/{id}', [StaffController::class, 'changeAvatarStaffById']);
            Route::post('/background-staff/{id}', [StaffController::class, 'changeBackgroundStaffById']);

            //staff Account
            Route::get('/get-staff-accounts', [StaffAccountController::class, 'getByPage']);
            Route::put('/lock-account/{id}', [StaffAccountController::class, 'lockAccount']);
            Route::get('/staff-detail/{id}', [StaffAccountController::class, 'staffDetail']);
            Route::delete('/indirectly-disconnect/{id}', [StaffAccountController::class, 'indirectlyDisconnect']);
            Route::post('/edit-request/{id}', [StaffAccountController::class, 'editRequest']);

            //branch
            Route::get('/branch/{id}', [BranchController::class, 'getBranchById']);
            Route::get('/branches', [BranchController::class, 'getListBranches']);

            //type-report
            Route::post('/type-reports', [TypeReportController::class, 'createsTypeReport']);
            Route::get('/type-reports', [TypeReportController::class, 'getRecords']);
            Route::put('/change-type-report', [TypeReportController::class, 'changeStatus']);
            Route::delete('/delete-type-report/{id}', [TypeReportController::class, 'deleteRecord']);

            //report_source
            Route::post('/report-source', [ReportSourceController::class, 'createsReportSource']);
            Route::get('/report-source', [ReportSourceController::class, 'getRecords']);
            Route::put('/change-report-source', [ReportSourceController::class, 'changeStatus']);
            Route::delete('/delete-report-source/{id}', [ReportSourceController::class, 'deleteRecord']);

            //report
            Route::post('/report', [ReportsController::class, 'addTicketReport']);

            //Broadcasting
            Route::post('/follow-account-admin', [ManagerController::class, 'followAccountAdmin']);
            Route::delete('/delete-account-admin', [ManagerController::class, 'statusChange']);
            Route::delete('/reset-list-account', [ManagerController::class, 'resetCache']);
            Route::get('/get', [ManagerController::class, 'get']);

            //notifications administration
            Route::get('/get-notifications', [NotificationController::class, 'getNotificationByIdStaff']);
            Route::get('/check-notifications/{id}', [NotificationController::class, 'CheckForUnreadNotifications']);
            Route::post('/test-no/{id}', [NotificationController::class, 'test']);
            Route::put('/change-watched-notification/{id}', [NotificationController::class, 'changeWatchedStatus']);
            Route::put('/change-watched-notification', [NotificationController::class, 'changeWatchedStatusByID']);

            //administration
            Route::get('/administrations', [Administration::class, 'getRecords']);

            //position
            Route::get('/positions', [Position::class, 'getRecords']);
        });
    });
});

//login
//Accept= application/json
