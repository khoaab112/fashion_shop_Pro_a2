<template>
    <div>
        <button class="btn btn-add"><font-awesome-icon icon="fa-solid fa-plus" /></button>
        <button class="btn btn-remove"><font-awesome-icon icon="fa-solid fa-minus" /></button>
        <button class="btn btn-save"><font-awesome-icon icon="fa-regular fa-floppy-disk" /></button>
        <button class="btn btn-block"><font-awesome-icon icon="fa-solid fa-ban" /></button>
        <button class="btn btn-change"><font-awesome-icon icon="fa-solid fa-list-ol" /></button>
        <button class="btn btn-rename"><font-awesome-icon icon="fa-regular fa-pen-to-square" /></button>
        <h4 class="pt-2 text-center">Quản lý Menu</h4>
        <code><ul>
                                                <li>đổi màu</li>
                                                <li>đổi tên</li>
                                                <li>thêm</li>
                                                <li>sửa</li>
                                                <li>active</li>
                                                <li>đổi index</li>
                                                <li>Thêm icon</li>
                                              </ul></code>
        <div v-if="dataMenu.length">
            <details class="ps-4" v-for="(item, key) in dataMenu" :key="key" open >
                <summary>
                    <input type="checkbox" :id="`${item.id_main}_id`" class="me-2" :checked="item.checked"
                        @change="checkAll(item)" />
                    <label :for="`${item.id_main}_id`" :style="{ color: item.color }">{{ item.main }}</label>
                </summary>
                <strong v-for="(itemSub, keySub) in item.sub" :key="keySub" v-if="item.sub.length > 0" class="ms-5" >
                    <input type="checkbox" :id="`${itemSub.id_sub}_id`" class="me-2" :checked="itemSub.checked" />
                    <label :for="`${itemSub.id_sub}_id`" :style="{ color: itemSub.sub_color }">{{ itemSub.sub }}</label><br />
                    <button class="btn btn-add ms-5" v-if="keySub + 1 == item.sub.length"><font-awesome-icon
                            icon="fa-solid fa-plus" /></button>
                </strong>
            </details>
            <button class="btn btn-add ms-4"><font-awesome-icon icon="fa-solid fa-plus" /></button>
        </div>
        <div v-else class="ps-4">
            <strong class="">Chưa có Menu nào đươc tạo</strong>
            <br>
            <form v-if="showFromCreate" @submit.prevent="SubmitFormCreate">
                <label for="newName">Tên Menu : </label><input type="text" id="newName" class="form-control ms-2"
                    placeholder="Nhập tên menu chính" name="newName" v-model="dataCreateNew.name">
                <span class="error-message-danger  ms-2">
                    {{ messageErrorCreate }}
                </span>
                <br>
                <div class="mt-3"></div>
                <label for="newColor">Màu chữ :</label>
                <input type="color" v-model="dataCreateNew.color" id="newColor" class="form-control ms-2">
                <input type="text" v-model="dataCreateNew.color" class="form-control ms-2" placeholder="Nhập hoặc chọn màu"
                    id="textColor">
                <br>
                <div class="mt-3"></div>
                <label for="indexMenu">Vị trí ưu tiên (mặc định 1) :</label><input type="text" id="indexMenu"
                    class="form-control  ms-2" v-model="dataCreateNew.order" disabled>
                <div class="mt-3"></div>
                <label for="activeMenu" class="form-check-label">Cho phép hoạt động :</label><input type="checkbox"
                    id="activeMenu" class="form-check-input ms-2" v-model="dataCreateNew.status"><strong class="ms-2"
                    :class="[dataCreateNew.status ? 'active' : 'block']">{{ dataCreateNew.status ? "Hoạt động" : "Khóa"
                    }}</strong>
                <div class="mt-3"></div>
                <div class="ls-btn">
                    <button class="btn-from btn-clear" type="reset"><font-awesome-icon icon="fa-solid fa-eraser" /></button>
                    <button class="btn-from btn-save" type="submit"><font-awesome-icon
                            icon="fa-regular fa-floppy-disk" /></button>
                </div>
            </form>
            <button class="btn-from btn-add" v-else @click="showFromCreate = !showFromCreate"><font-awesome-icon
                    icon="fa-solid fa-plus" /></button>
            <button class="btn btn-add"><font-awesome-icon icon="fa-solid fa-plus" /></button>
            <button class="btn btn-remove"><font-awesome-icon icon="fa-solid fa-minus" /></button>
            <button class="btn btn-save"><font-awesome-icon icon="fa-regular fa-floppy-disk" /></button>
            <button class="btn btn-block"><font-awesome-icon icon="fa-solid fa-ban" /></button>
            <button class="btn btn-change"><font-awesome-icon icon="fa-solid fa-list-ol" /></button>
            <button class="btn btn-rename"><font-awesome-icon icon="fa-regular fa-pen-to-square" /></button>
        </div>
    </div>
</template>

<script>
import apiWeb from "@/js/api/admin/apiWeb.js";
import { ElNotification } from "element-plus";

export default {
    name: "Menu-Vue",
    components: {},
    setup() { },
    directives: {},
    data() {
        return {
            dataMenu: [],
            colorAdd: "",
            dataCreateNew: {
                name: "",
                color: "#000000",
                status: true,
                order: 1
            },
            showFromCreate: false,
            messageErrorCreate: "",
        };
    },
    created() {
        this.getMenu();
    },
    mounted() { },
    computed() { },
    updated() { },
    methods: {
        getMenu() {
            apiWeb
                .menu()
                .then((res) => {
                    var dataResponse = res.data;
                    if (dataResponse.result_code == 200) {
                        this.dataMenu = dataResponse.results;
                        this.dataMenu = dataResponse.results.reduce((acc, item) => {
                            const existingGroup = acc.find((group) => group.id_main === item.id_main);
                            if (existingGroup) {
                                // Nếu nhóm đã tồn tại, thêm dữ liệu vào mảng con sub
                                existingGroup.sub.push({
                                    id_sub: item.id_sub,
                                    sub: item.sub,
                                    sub_color: item.sub_color,
                                    sub_status: item.sub_status,
                                    sub_order: item.sub_order,
                                    checked: false,
                                });
                            } else {
                                // Nếu nhóm chưa tồn tại, tạo một nhóm mới và thêm vào mảng kết quả
                                acc.push({
                                    id_main: item.id_main,
                                    main: item.main,
                                    color: item.color,
                                    main_status: item.main_status,
                                    main_order: item.main_order,
                                    checked: false,
                                    sub: [
                                        {
                                            id_sub: item.id_sub,
                                            sub: item.sub,
                                            sub_color: item.sub_color,
                                            sub_status: item.sub_status,
                                            sub_order: item.sub_order,
                                            checked: false,
                                        },
                                    ],
                                });
                            }
                            return acc;
                        }, []);
                        console.log(this.dataMenu);
                    } else throw new Error(dataResponse.result_code);
                })
                .catch((error) => {
                    ElNotification({
                        title: "Error",
                        message: "Có lỗi bất thường",
                        type: "error",
                    });
                });
        },
        checkAll(data) {
            data.checked = !data.checked;
            data.sub.forEach((value) => {
                value.checked = !value.checked;
            });
        },
        SubmitFormCreate() {
            this.messageErrorCreate = "";
            if (this.dataCreateNew.name.length <= 0) {
                return this.messageErrorCreate = "Tên Không được bỏ trống";
            }
        }
    },
};
</script>

<style scoped>
.active {
    color: #2c96ff;
}

.block {
    color: red;
}

.btn {
    border: 1px solid white;
    border-radius: 20px;
    width: 33px;
    height: 27px;
    font-size: 9px;
}

.btn-from {
    border: 1px solid white;
    border-radius: 20px;
    width: 51px;
    height: 51px;
    font-size: 18px;
    margin-right: 1rem;
}

.btn:hover,
.btn-from:hover {
    transform: scale(1.1);
}

.btn-add {
    color: white;
    background-color: #44c767;
}

.btn-remove {
    color: white;
    background-color: red;
}

.btn-save {
    color: white;
    background-color: #2c96ff;
}

.btn-block {
    color: white;
    background-color: orange;
}

.btn-change {
    color: white;
    background-color: #8313f3;
}

.btn-rename {
    color: white;
    background-color: #3dd1e7;
}

.btn-clear {
    border: 1px solid #d9d9d9;
    ;
}

#newName {
    width: 20rem;
    display: inline-block;
}

#newColor,
#indexMenu {
    width: 3rem;
    display: inline-block;
    text-align: center;

}

#textColor {
    width: 15rem;
    display: inline-block;
}

.ls-btn {
    display: flex;
    justify-content: center;
}
</style>
