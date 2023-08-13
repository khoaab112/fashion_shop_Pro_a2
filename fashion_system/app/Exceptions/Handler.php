<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Auth\AuthenticationException;
use App\Helpers\CodeHttpHelpers;
use App\Http\Controllers\Authentication\AuthnController;

class Handler extends ExceptionHandler
{
    /**
     * The list of the inputs that are never flashed to the session on validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     */
    public function register(): void
    {
        $this->reportable(function (Throwable $e) {
            //
        });
    }
    public function unauthenticated($request, AuthenticationException $exception)
    {
        $result = AuthnController::reissueAccessToken($request);
        if (!$result)
            return CodeHttpHelpers::returnJson(401, false, 'Unauthorized', 401);
            return CodeHttpHelpers::returnJson($result['code'], $result['status'], $result['results'],$result['http']);
    }
}
