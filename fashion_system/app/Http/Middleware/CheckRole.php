<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Http\Controllers\Authentication\AuthnController;
use App\Helpers\CodeHttpHelpers;
use App\Repositories\Administration\AdministrationRepository;
use Illuminate\Support\Facades\DB;

class CheckRole
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, ...$role): Response
    {
        $bearerToken = $request->bearerToken();
        if (!$bearerToken)  return CodeHttpHelpers::returnJson(403, false, 'not have access', 403);
        $decode = AuthnController::decodeJwtToken($bearerToken);
        $arrRole = [
            'SUPERADMIN',
            'ADMIN',
            'STAFF',
            'PRODUCT',
            'BRANCH',
            'TRANSPORT',
            'ORDER',
            'CUSTOMERMANAGEMENT',
            'WAREHOUSE',
            'WEB',
            'REPORT',
            'FEEDBACK'
        ];
        $isExits = in_array($decode['value']->role, $arrRole);
        $isLicensed = in_array($decode['value']->role, $role);
        if ($isLicensed &&  $isExits) return $next($request);
        if ($decode['value']->role == 'SUPERADMIN') return $next($request);
        return CodeHttpHelpers::returnJson(403, false, 'role not have access', 403);
    }
}
