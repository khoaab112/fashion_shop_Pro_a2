<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

use App\Repositories\UserStaff\UserStaffRepository;
use App\Repositories\UserStaff\UserStaffRepositoryInterface;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->bind(UserStaffRepositoryInterface::class,UserStaffRepository::class);
    }


    // public function register() {
    //     $models = array(
    //         'CustomModel',
    //         'CustomModel2',
    //         'CustomModel3'
    //     );

    //     foreach ($models as $model) {
    //         $this->app->bind("App\Contracts\\{$model}Interface", "App\Repositories\\{$model}Repository");
    //     }
    // }
    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
