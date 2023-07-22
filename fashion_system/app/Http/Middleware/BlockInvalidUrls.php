<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Helpers\CodeHttpHelpers;
use Illuminate\Support\Facades\Route;

class BlockInvalidUrls
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if (!$this->isValidUrl($request->url())) {     
            return CodeHttpHelpers::returnJson(401,false,'null',401);
        }
        $definedRoutes = collect(Route::getRoutes())->map(function ($route) {
            return $route->uri;
        });
        if (!$definedRoutes->contains($request->path())) {
            return CodeHttpHelpers::returnJson(404,false,'url not found',404);
        }

        return $next($request);
    }
    private function isValidUrl($url)
    {
        //tạm thời ẩn bỏ
        // return strpos($url, env('APP_URL')) !== false;
        return true;
    }
}
