<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Helpers\CodeHttpHelpers;
use App\Repositories\SubMenu\SubMenuRepository;
use App\Repositories\MenuMain\MenuMainRepository;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;

class WebController extends Controller
{
    //
    protected $subMenu, $menuMain;
    public function __construct(SubMenuRepository $subMenu, MenuMainRepository $menuMain)
    {

        $this->subMenu = $subMenu;
        $this->menuMain = $menuMain;
    }
    public function getMenu()
    {
        try {
            $results = DB::table('sub_menu as sub')
                ->rightJoin('menu_main as main', 'sub.menu_main_id', '=', 'main.id')
                ->where('main.status', true)
                ->select('main.id as id_main','main.name as main', 'main.color', 'main.status as main_status', 'main.order as main_order','sub.id as id_sub', 'sub.name as sub', 'sub.color as sub_color', 'sub.status as sub_status', 'sub.order as sub_order')
                ->orderBy('main.order', 'asc')
                ->orderBy('sub.order', 'asc')
                ->get();
            return CodeHttpHelpers::returnJson(200, true, $results, 200);
        } catch (\Throwable $th) {
            Log::error($th);
            return CodeHttpHelpers::returnJson(500, false, "Lỗi bất thường", 500);
        }
    }
}
