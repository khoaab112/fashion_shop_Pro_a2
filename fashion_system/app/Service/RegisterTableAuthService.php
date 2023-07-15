<?php

namespace App\Service;

use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider;

//register 2 tables for authentication
class CustomAuthServiceProvider extends AuthServiceProvider
{
    public function boot()
    {
        $this->registerPolicies();

        Auth::extend('staff_account', function ($app, $name, array $config) {
            return new \Illuminate\Auth\EloquentUserProvider($app['hash'], $config['staff_account']);
        });

        Auth::extend('account_customers', function ($app, $name, array $config) {
            return new \Illuminate\Auth\EloquentUserProvider($app['hash'], $config['account_customers']);
        });
    }
}
