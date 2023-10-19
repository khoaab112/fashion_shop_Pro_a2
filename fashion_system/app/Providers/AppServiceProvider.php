<?php

namespace App\Providers;

use App\Models\Administration;

use Illuminate\Support\ServiceProvider;

use App\Repositories\UserStaff\UserStaffRepository;
use App\Repositories\UserStaff\UserStaffRepositoryInterface;
use App\Repositories\AccountAdminAction;
use App\Repositories\AccountCustomer;
use App\Repositories\ActionAdmin;
use App\Repositories\Administration as AdministrationRe;
use App\Repositories\Ads;
use App\Repositories\Bill;
use App\Repositories\Branch;
use App\Repositories\CommentsNews;
use App\Repositories\CommentsProduct;
use App\Repositories\ContactSupport;
use App\Repositories\Customers;
use App\Repositories\DepotTicket;
use App\Repositories\EventAds;
use App\Repositories\FailedJobs;
use App\Repositories\GiftCode;
use App\Repositories\HistoryPayment;
use App\Repositories\ImgNews;
use App\Repositories\ImgProducts;
use App\Repositories\IntermediaryAccountservice;
use App\Repositories\ListCodesReceived;
use App\Repositories\ListGiftCodes;
use App\Repositories\ListProductsByBill;
use App\Repositories\LogDeletes;
use App\Repositories\LogLogin;
use App\Repositories\LogUpdates;
use App\Repositories\MenuMain;
use App\Repositories\Migrations;
use App\Repositories\News;
use App\Repositories\PasswordResetTokens;
use App\Repositories\PaymentMethods;
use App\Repositories\PersonalAccessTokens;
use App\Repositories\Policy;
use App\Repositories\Position;
use App\Repositories\PriceDifference;
use App\Repositories\Products;
use App\Repositories\ProductsinStock;
use App\Repositories\Promotion;
use App\Repositories\Rank;
use App\Repositories\Reports;
use App\Repositories\ReportSource;
use App\Repositories\ServiceByProduct;
use App\Repositories\ShippingMethod;
use App\Repositories\Staff;
use App\Repositories\StaffAccount;
use App\Repositories\SubMenu;
use App\Repositories\TransferProviders;
use App\Repositories\TypePromotion;
use App\Repositories\TypeReport;
use App\Repositories\TypeTicket;
use App\Repositories\TypeUpdate;
// use App\Repositories\UserStaff;
use App\Repositories\WareHouse;
use App\Repositories\TypeNotification;
use App\Repositories\AdminsNotification;
use App\Repositories\CustomersNotification;










class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->bind(UserStaffRepositoryInterface::class,UserStaffRepository::class);
        $this->app->bind(AccountAdminAction\AccountAdminActionReposotpryIntaface::class,AccountAdminAction\AccountAdminActionRepository::class);
        $this->app->bind(AccountCustomer\AccountCustomerRepositoryInterface::class,AccountCustomer\AccountCustomersRepository::class);
        $this->app->bind(ActionAdmin\ActionAdminRepositoryInterface::class,ActionAdmin\ActionRepository::class);
        $this->app->bind(AdministrationRe\AdministrationRepositoryInterface::class,AdministrationRe\AdministrationRepository::class);
        $this->app->bind(Ads\AdsRepositoryInterface::class,Ads\AdsRepositoryInterface::class);
        $this->app->bind(Bill\BillRepositoryInterface::class,Bill\BillRepository::class);
        $this->app->bind(Branch\BranchRepositoryInterface::class,Branch\BranchRepository::class);
        $this->app->bind(CommentsNews\CommentsNewsRepositoryInterface::class,CommentsNews\CommentsNewsRepository::class);
        $this->app->bind(CommentsProduct\CommentsProductRepositoryInterface::class,CommentsProduct\CommentsProductRepository::class);
        $this->app->bind(ContactSupport\ContactSupportRepositoryInterface::class,ContactSupport\ContactSupportRepository::class);
        $this->app->bind(Customers\CustomersRepositoryInterface::class,Customers\CustomersRepository::class);
        $this->app->bind(DepotTicket\DepotTicketRepositoryInterface::class,DepotTicket\DepotTicketRepository::class);
        $this->app->bind(EventAds\EventAdsRepositoryInterface::class,EventAds\EventAdsRepository::class);
        $this->app->bind(FailedJobs\FailedJobsRepositoryInterface::class,FailedJobs\FailedJobsRepository::class);
        $this->app->bind(GiftCode\GiftCodeRepositoryInterface::class,GiftCode\GiftCodeRepository::class);
        $this->app->bind(HistoryPayment\HistoryPaymentRepositoryInterface::class,HistoryPayment\HistoryPaymentRepository::class);
        $this->app->bind(ImgNews\ImgNewsRepositoryInterface::class,ImgNews\ImgNewsRepository::class);
        $this->app->bind(ImgProducts\ImgProductsRepositoryInterface::class,ImgProducts\ImgProductsRepository::class);
        $this->app->bind(IntermediaryAccountservice\IntermediaryAccountserviceRepositoryInterface::class,IntermediaryAccountservice\IntermediaryAccountserviceRepository::class);
        $this->app->bind(ListCodesReceived\ListCodesReceivedRepositoryInterface::class,ListCodesReceived\ListCodesReceivedRepository::class);
        $this->app->bind(ListGiftCodes\ListGiftCodesRepositoryInterface::class,ListGiftCodes\ListGiftCodesRepository::class);
        $this->app->bind(ListProductsByBill\ListProductsByBillRepositoryInterface::class,ListProductsByBill\ListProductsByBillRepository::class);
        $this->app->bind(LogDeletes\LogDeletesRepositoryInterface::class,LogDeletes\LogDeletesRepository::class);
        $this->app->bind(LogLogin\LogLoginRepositoryInterface::class,LogLogin\LogLoginRepository::class);
        $this->app->bind(LogUpdates\LogUpdatesRepositoryInterface::class,LogUpdates\LogUpdatesRepository::class);
        $this->app->bind(MenuMain\MenuMainRepositoryInterface::class,MenuMain\MenuMainRepository::class);
        $this->app->bind(Migrations\MigrationsRepositoryInterface::class,Migrations\MigrationsRepository::class);
        $this->app->bind(News\NewsRepositoryInterface::class,News\NewsRepository::class);
        $this->app->bind(PasswordResetTokens\PasswordResetTokensRepositoryInterface::class,PasswordResetTokens\PasswordResetTokensRepository::class);
        $this->app->bind(PaymentMethods\PaymentMethodsRepositoryInterface::class,PaymentMethods\PaymentMethodsRepository::class);
        $this->app->bind(PersonalAccessTokens\PersonalAccessTokensRepositoryInterface::class,PersonalAccessTokens\PersonalAccessTokensRepository::class);
        $this->app->bind(Policy\PolicyRepositoryInterface::class,Policy\PolicyRepository::class);
        $this->app->bind(Position\PositionRepositoryInterface::class,Position\PositionRepository::class);
        $this->app->bind(PriceDifference\PriceDifferenceRepositoryInterface::class,PriceDifference\PriceDifferenceRepository::class);
        $this->app->bind(Products\ProductsRepositoryInterface::class,Products\ProductsRepository::class);
        $this->app->bind(ProductsinStock\ProductsinStockRepositoryInterface::class,ProductsinStock\ProductsinStockRepository::class);
        $this->app->bind(Promotion\PromotionRepositoryInterface::class,Promotion\PromotionRepository::class);
        $this->app->bind(Rank\RankRepositoryInterface::class,Rank\RankRepository::class);
        $this->app->bind(Reports\ReportsRepositoryInterface::class,Reports\ReportsRepository::class);
        $this->app->bind(ReportSource\ReportSourceRepositoryInterface::class,ReportSource\ReportSourceRepository::class);
        $this->app->bind(ServiceByProduct\ServiceByProductRepositoryInterface::class,ServiceByProduct\ServiceByProductRepository::class);
        $this->app->bind(ShippingMethod\ShippingMethodRepositoryInterface::class,ShippingMethod\ShippingMethodRepository::class);
        $this->app->bind(Staff\StaffRepositoryInterface::class,Staff\StaffRepository::class);
        $this->app->bind(StaffAccount\StaffAccountRepositoryInterface::class,StaffAccount\StaffAccountRepository::class);
        $this->app->bind(SubMenu\SubMenuRepositoryInterface::class,SubMenu\SubMenuRepository::class);
        $this->app->bind(TransferProviders\TransferProvidersRepositoryInterface::class,TransferProviders\TransferProvidersRepository::class);
        $this->app->bind(TypePromotion\TypePromotionRepositoryInterface::class,TypePromotion\TypePromotionRepository::class);
        $this->app->bind(TypeReport\TypeReportRepositoryInterface::class,TypeReport\TypeReportRepository::class);
        $this->app->bind(TypeTicket\TypeTicketRepositoryInterface::class,TypeTicket\TypeTicketRepository::class);
        $this->app->bind(TypeUpdate\TypeUpdateRepositoryInterface::class,TypeUpdate\TypeUpdateRepository::class);
        $this->app->bind(WareHouse\WareHouseRepositoryInterface::class,WareHouse\WareHouseRepository::class);
        $this->app->bind(TypeNotification\TypeNotificationRepositoryInterface::class,TypeNotification\TransferProvidersRepository::class);
        $this->app->bind(AdminsNotification\AdminsNotificationRepositoryInterface::class,AdminsNotification\AdminsNotificationRepository::class);
        $this->app->bind(CustomersNotification\CustomersNotificationRepositoryInterface::class,CustomersNotification\CustomersNotificationProvidersRepository::class);

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
