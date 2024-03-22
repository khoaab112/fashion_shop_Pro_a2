<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Authentication\AuthenticationCustomersController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::view('/{any}', 'app')->where('any', '.*');
Route::get('/welcome', function () {
    return view('templates.verificationEmail');
})->name('welcome');
Route::group(['prefix' => 'auth'], function () {
    Route::get('/verification', [AuthenticationCustomersController::class, 'pathValidation'])->name('active');
    Route::post('/verification', [AuthenticationCustomersController::class, 'createPassword'])->name('createPassword');
});
// Route::get('/forgot-password', function () {
//     return view('templates.confirmPassword');
// })->name('forgotPassword');

Route::get('/{any}', function () {
    return view('app');
})->where('any', '^(?!api\/)[\/\w\.-]*');
