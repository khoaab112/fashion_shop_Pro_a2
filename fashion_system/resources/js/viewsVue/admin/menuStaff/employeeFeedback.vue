<template>
    <div>
        <div class="main-support">
            <p>Tên phân mềm : <strong>{{ nameSystem }}</strong></p>
            <p>Số phiên bản : <strong>{{ versionSystem }}</strong></p>
            <hr />
            <strong class="title-comments h3">Đóng góp ý kiến</strong>
            <div class="content-support">
                <input class="form-control input-title" type="text" placeholder="Tiêu đề" aria-label="default input " />
                <div class="input-title">
                    <QuillEditor theme="snow" toolbar="full" :contentType="contentType" :readOnly="readOnly"
                        :placeholder="placeholder" />
                </div>
                <div class="text-end input-title">
                    <button type="button" class="btn btn-primary ">Gửi<loadingSpinner></loadingSpinner></button>

                </div>
            </div>
        </div>
        <div class="lining"></div>
    </div>
</template>

<script>
import ENV from "@/js/generalSetting/filterEnv.js";
import loadingSpinner from "../../components/loadingSpinner.vue";
import apiReport from '@/js/api/admin/apiReport.js';
import globalVariable from "@/js/generalSetting/globalVariable.js";


export default {
    name: 'employeeFeedback',
    components: {
        loadingSpinner,
    },
    setup() {
    },
    directives: {
    },
    data() {
        return {
            nameSystem: ENV.SYSTEM_NAME,
            versionSystem: ENV.VERSION,
            contentType: 'html',
            readOnly: false,
            placeholder: 'Nội dung đóng góp...'
        };
    },
    created() {
        // Logic khi component được khởi tạo
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
        sendFeedback() {
            // this.staff = await globalVariable.getGlobalVariableInfoStaff();

            // var data = {
            //     'customers_id':,
            //     'sub_report': false,
            //     'is_processed': false,
            //     'content': '',

            // };
        },
        // Các phương thức xử lý sự kiện hoặc logic khác
    },
};
</script>

<style>
.input-title {
    width: 80%;
    margin: 1rem;
}

.ql-container {
    padding: 50px;
}

.lining {
    width: 100%;
    height: 1rem;
}

.main-support {
    padding: 18px 2.3rem;
}
</style>
