<template>
    <el-dialog v-model="centerDialogVisible" title="Thêm tài khoản" width="500" align-center @close="closeDialog">
        <form action="">
            <div class="full-name">
                <div class="form-floating mb-3 me-2 first_name">
                    <input type="text" class="form-control" id="first_name" placeholder="Tên" autocomplete="off"
                        v-model="state.data.first_name">
                    <label for="first_name">Tên <span class="require">*</span></label>
                    <span class="error-msg ms-2" v-if="v$.data.first_name.$error">
                        {{ v$.data.first_name.$errors[0].$message }}
                    </span>
                    <span class="error-msg ms-2" v-if="errorMessage.first_name">
                        {{ errorMessage.first_name[0] }}
                    </span>
                </div>
                <div class="form-floating mb-3 last_name">
                    <input type="text" class="form-control" id="last_name" placeholder="Họ"
                        v-model="state.data.last_name">
                    <label for="last_name">Họ<span class="require">*</span></label>
                    <span class="error-msg ms-2" v-if="v$.data.last_name.$error">
                        {{ v$.data.last_name.$errors[0].$message }}
                    </span>
                    <span class="error-msg ms-2" v-if="errorMessage.last_name">
                        {{ errorMessage.last_name[0] }}
                    </span>
                </div>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="address" placeholder="Địa chỉ" v-model="state.data.address">
                <label for="address">Địa chỉ</label>
            </div>
            <div class="form-floating mb-3">
                <input type="number" class="form-control" id="phone_number" placeholder="SĐT"
                    v-model="state.data.phone_number">
                <label for="phone_number">SĐT</label>
                <span class="error-msg ms-2" v-if="v$.data.phone_number.$error">
                    {{ v$.data.phone_number.$errors[0].$message }}
                </span>
                <span class="error-msg ms-2" v-if="errorMessage.phone_number">
                    {{ errorMessage.phone_number[0] }}
                </span>
            </div>
            <div class="form-floating mb-3">
                <input type="email" class="form-control" id="email" placeholder="email" v-model="state.data.email">
                <label for="email">Email<span class="require">*</span></label>
                <span class="error-msg ms-2" v-if="v$.data.email.$error">
                    {{ v$.data.email.$errors[0].$message }}
                </span>
                <span class="error-msg ms-2" v-if="errorMessage.email">
                    {{ errorMessage.email[0] }}
                </span>
            </div>
            <div class="last-layout">
                <el-switch v-model="state.data.sex" class="mb-2"
                    style="--el-switch-on-color: #13ce66; --el-switch-off-color: #ff4949" active-text="Nam"
                    inactive-text="Nữ" />
                <el-date-picker v-model="state.data.birthday" type="date" placeholder="Ngày sinh" :size="size" />
            </div>
            <span class="error-msg me-2 float-end" v-if="v$.data.birthday.$error">
                {{ v$.data.birthday.$errors[0].$message }}
            </span>
            <span class="error-msg ms-2" v-if="errorMessage.birthday">
                {{ errorMessage.birthday[0] }}
            </span>
        </form>

        <template #footer>
            <div class="dialog-footer">
                <el-button @click="closeDialog">Đóng</el-button>
                <el-button type="primary" @click="submitForm()">
                    Tạo
                </el-button>
            </div>
        </template>
    </el-dialog>
</template>

<script>
import { useVuelidate } from '@vuelidate/core'
import { required, helpers, minLength, maxLength, numeric, email } from '@vuelidate/validators'
import { reactive, computed } from 'vue'
import apiCustomer from "@/js/api/admin/apiCustomer.js";
import { ElNotification } from "element-plus";
export default {
    name: 'dialogCreateCustomer',
    components: {

    },
    props: ["active"],
    setup() {
    },
    directives: {
    },
    data() {
        return {
            centerDialogVisible: this.active ?? false,
            size: 'large',
            errorMessage: {},
        };
    },
    setup() {
        const state = reactive({
            data: {
                first_name: '',
                last_name: '',
                address: '',
                phone_number: '',
                email: '',
                sex: 1,
                birthday: '',
            },
        });
        const rules = computed(() => {
            return {
                data: {
                    first_name: {
                        required: helpers.withMessage('Tên không được bỏ trống', required),
                        // email: helpers.withMessage('Hãy nhập mail', email)
                    },
                    last_name: {
                        required: helpers.withMessage('Họ không được bỏ trống', required),
                    },
                    phone_number: {
                        minLength: helpers.withMessage('Số điện thoại phải có 10 số', minLength(10)),
                        maxLength: helpers.withMessage('Số điện thoại phải có 10 số', maxLength(10)),
                        numeric: helpers.withMessage('Phải là số', numeric),
                    },
                    email: {
                        required: helpers.withMessage('Email không được bỏ trống', required),
                        email: helpers.withMessage('Email không đúng định dạng', email),
                    },
                    birthday: {
                        custom: helpers.withMessage('Thời gian không hợp lệ', (value) => {
                            let date = new Date(value);
                            let currentDate = new Date();
                            date.setHours(0, 0, 0, 0);
                            currentDate.setHours(0, 0, 0, 0);
                            return date - currentDate >= 0 ? false : true;
                        }),
                    }
                },
            }
        });
        const v$ = useVuelidate(rules, state);
        const resetValidation = () => {
            v$.value.$reset();
        };
        return {
            state,
            v$,
            resetValidation
        }
    },
    watch: {
        active(val) {
            this.centerDialogVisible = val;
        },
    },
    created() {

    },
    mounted() {
        // Logic sau khi component được gắn kết (render) vào DOM
    },
    computed() {
        // được sử dụng để định nghĩa các thuộc tính tính toán
    },
    updated() {

    },
    destroyed() {

    },
    methods: {
        closeDialog() {
            this.state.data = {};
            this.errorMessage = {};
            this.resetValidation();
            this.centerDialogVisible = false
            this.$emit('close-dialog', false);
        },
        async submitForm() {
            const isFormCorrect = await this.v$.$validate();
            if (!isFormCorrect) return;
            const data = this.state.data;
            apiCustomer
                .createCustomer(data)
                .then((res) => {
                    var dataResponse = res.data;
                    this.errorMessage = {}
                    if (dataResponse.result_code == 200) {
                        ElNotification({
                            title: "Success",
                            message: "Tạo mới thành công",
                            type: "success",
                        });
                        this.closeDialog();
                    }
                    else if (dataResponse.result_code == 400) {
                        this.errorMessage = dataResponse.results;
                    }
                    else throw new Error(dataResponse.results);
                })
                .catch((error) => {
                    ElNotification({
                        title: "Error",
                        message: "Có lỗi bất thường",
                        type: "error",
                    });
                });
        },
    },
};
</script>

<style scoped>
.full-name {
    display: flex;
    justify-content: space-around;
}

.last_name {
    width: 60%;
}

.first_name {
    width: 40%;
}

span.require {
    color: red;
}

.last-layout {
    display: flex;
    justify-content: space-between;
}
</style>
