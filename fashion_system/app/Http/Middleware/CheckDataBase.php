<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpFoundation\Response;
use App\Helpers\CodeHttpHelpers;

class CheckDataBase
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {

        try {
            DB::connection()->getPdo();
            if (DB::connection()->getDatabaseName()) {
                return $next($request);
            } else {
                return CodeHttpHelpers::returnJson(500, false, 'Database error || lost database connection', 500);
            }
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, 'Undefinition', 500);
        }
    }
}
