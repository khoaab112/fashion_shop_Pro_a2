<template>
    <!-- đầu vào là tổng record , số trang hiện tại -->
    <section>
        <div class="row mb-5">
            <div class="col-md-12">
                <div class="block-27">
                    <ul>
                        <li><button class="page-jump" @click="activeJump(1)"><font-awesome-icon
                                    icon="fa-solid fa-angles-left" /></button></li>
                        <li><button class="page-jump" @click="activeJump(2)"><font-awesome-icon
                                    icon="fa-solid fa-angle-left" /></button></li>
                        <li class="active" @click="choosePage(currentPage)"><button>{{ currentPage }}</button></li>
                        <li v-if="lastNumber >= 2"><button @click="choosePage(currentPage + 1)">{{ currentPage + 1
                        }}</button>
                        </li>
                        <li v-if="lastNumber >= 5"><button
                                @click="choosePage(pageCenter(lastNumber / currentPage))"><font-awesome-icon
                                    icon="fa-solid fa-ellipsis" /></button></li>
                        <li v-if="lastNumber >= 4"><button @click="choosePage(lastNumber - 1)">{{ lastNumber - 1 }}</button>
                        </li>
                        <li v-if="lastNumber > 4"><button @click="choosePage(lastNumber)">{{ lastNumber }}</button></li>
                        <li><button class="page-jump" @click="activeJump(3)"><font-awesome-icon
                                    icon="fa-solid fa-angle-right" /></button></li>
                        <li v-if="lastNumber >= 10"><button class="page-jump" @click="activeJump(4)"><font-awesome-icon
                                    icon="fa-solid fa-angles-right" /></button></li>
                    </ul>
                    <p class="description">{{ numberOfRecords() }}&nbsp;/&nbsp;{{ total }}&nbsp;bản ghi</p>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
export default {
    name: 'paginationButton',
    components: {
    },
    props: {
        total: {
            type: Number,
        },
        currentPage: {
            type: Number,
        },
    },
    watch: {
        total(value) {
            this.totalRecord = Number(value);
            this.lastNumber = this.convertRow(Number(value));
            console.log(value);
        },
        currentPage(value) {
            this.page = Number(value);
        },
    },
    setup() {
    },
    directives: {
    },
    data() {
        return {
            totalRecord: Number(this.total),
            page: Number(this.currentPage),
            lastNumber: null,
        };
    },
    created() {
        this.lastNumber = this.convertRow(this.totalRecord);
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
        activePage(value) {
            this.$emit('page-return', value);
        },
        // nhảy 1 tragn và 10 trang
        activeJump(value) {
            switch (value) {
                case 1:
                    let resultCase1 = this.currentPage - 10
                    if (!resultCase1) return this.$emit('page-return', 1)
                    return this.$emit('page-return', resultCase1);
                case 2:
                    return this.$emit('page-return', this.currentPage - 1);
                case 3:
                    let resultCase3 = this.currentPage + 1
                    if (resultCase3 >= this.convertRow(this.row)) return this.$emit('page-return', this.currentPage)
                    return this.$emit('page-return', resultCase3);
                case 4:
                    let resultCase4 = this.currentPage + 10;
                    if (resultCase4 >= this.convertRow(this.row)) return this.$emit('page-return', this.currentPage)
                    return this.$emit('page-return', resultCase4);
            }
        },
        convertRow(value) {
            const result = Math.ceil((value / 10))
            return result;
        },
        choosePage(value) {
            console.log(value);
            return this.$emit('page-return', value);
        },
        pageCenter(value) {
            const result = Math.ceil(value)
            return result;
        },
        numberOfRecords() {
            var roundedNumber = this.lastNumber * 10;
            if (this.page < this.lastNumber) {
                return this.page*10;
            }
            if (roundedNumber == this.totalRecord) {
                return 10;
            }
            else
                return (10 - (Number(roundedNumber) - Number(this.totalRecord)));
        }
    },
};
</script>

<style scoped>
.heading-section {
    font-size: 32px;
}

.heading-section small {
    font-size: 16px;
}

.block-27 ul {
    padding: 0;
    margin: 0;
}

.block-27 ul li {
    display: inline-block;
    margin-bottom: 4px;
    font-weight: 400;
}

.block-27 ul li:hover button {
    background: #28a745;
    color: white;
}

.block-27 ul li button,
.block-27 ul li span {
    color: gray;
    text-align: center;
    display: inline-block;
    width: 40px;
    height: 40px;
    line-height: 40px;
    border-radius: 50%;
    border: 1px solid #e6e6e6;
}

.block-27 ul li.active button,
.block-27 ul li.active span {
    background: #7cb9e8;
    color: #fff;
    border: 1px solid transparent;
}

.page-jump:hover {
    background: #778ba5 !important;
    color: white;
}
.description{
    margin-top: 1rem;
    font-size: 90%;
    font-style: italic;
    font-weight: bold;
}
</style>
