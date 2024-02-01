<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Helpers\CodeHttpHelpers;
use App\Helpers\validationHelpers;
use App\Repositories\SubMenu\SubMenuRepository;
use App\Repositories\MenuMain\MenuMainRepository;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;

class MenuController extends Controller
{
    //
    protected $subMenu, $menuMain;
    protected $validationRulesMenu = [
        'name' => 'required|unique:menu_main,name',
    ];
    protected   $attributeNamesMenu = [
        'name' => 'Tên Menu',
    ];
    protected $validationRulesSubMenu = [
        'name' => 'required|unique:sub_menu,name',
        'menu_main_id' => 'required|exists:menu_main,id',
    ];
    protected   $attributeNamesSubMenu = [
        'name' => 'Tên Menu',
        'main_id' => 'ID cha',
    ];
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
                ->select('main.id as id_main', 'main.name as main', 'main.color', 'main.status as main_status', 'main.order as main_order', 'sub.id as id_sub', 'sub.name as sub', 'sub.color as sub_color', 'sub.status as sub_status', 'sub.order as sub_order')
                ->orderBy('main.order', 'asc')
                ->orderBy('sub.order', 'asc')
                ->get();
            return CodeHttpHelpers::returnJson(200, true, $results, 200);
        } catch (\Throwable $th) {
            Log::error($th);
            return CodeHttpHelpers::returnJson(500, false, "Lỗi bất thường", 500);
        }
    }
    public function createMenu(Request $request)
    {
        try {
            $validator = validationHelpers::validation($request->all(), $this->validationRulesMenu, $this->attributeNamesMenu);
            if ($validator->fails()) {
                $errors = $validator->errors();
                return CodeHttpHelpers::returnJson(400, false, $errors, 200);
            }
            $menu = [
                'name' => $request->post('name'),
                'color' => $request->post('color'),
                'order' => $request->post('order'),
                'status' => true,
            ];
            $result = $this->menuMain->create($menu);
            return CodeHttpHelpers::returnJson(200, true, "Tạo thành công", 200);
        } catch (\Exception $exception) {
            Log::error($exception);
            return CodeHttpHelpers::returnJson(500, false, $exception, 500);
        }
    }
    public function createSubMenu(Request $request)
    {
        try {
            $validator = validationHelpers::validation($request->all(), $this->validationRulesSubMenu, $this->attributeNamesSubMenu);
            if ($validator->fails()) {
                $errors = $validator->errors();
                return CodeHttpHelpers::returnJson(400, false, $errors, 200);
            }
            $menu = [
                'menu_main_id' => $request->post('menu_main_id'),
                'name' => $request->post('name'),
                'color' => $request->post('color'),
                'order' => $request->post('order'),
                'status' => true,
            ];
            $result = $this->subMenu->create($menu);
            return CodeHttpHelpers::returnJson(200, true, "Tạo thành công", 200);
        } catch (\Exception $exception) {
            Log::error($exception);
            return CodeHttpHelpers::returnJson(500, false, $exception, 500);
        }
    }
    public function lockMenu(Request $request)
    {
        $type=$request->post('type');
        if ($type == 'main') {}
        else{

        }
    }
    public function updateMenu(Request $request)
    {
        $type=$request->post('type');
        if ($type == 'main') {}
        else{

        }
    }
}
