<template>
    <table>
        <thead>
            <tr>
                <th v-for="(val, indexTitles) in titles" :key="indexTitles">{{ val.label }}</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(record, key) of  items " :key="key">

                <td v-for="(valTitles, indexTitles) in  titles " :key="indexTitles">
                    <template v-if="searchCellName(record, valTitles.key)">
                        <slot :name="`cell(${valTitles.key})`" :data="{ value: record[valTitles.key] }"></slot>
                    </template>
                </td>
            </tr>
        </tbody>
    </table>
</template>

<script scoped>
export default {
    name: 'tableClient',
    components: {
    },
    props: {
        //  titles = key , label
        titles: Array,
        items: Array
    },
    watch: {
        items(val){
           this.itemsTables=val;
        }
    },
    setup() {
    },
    directives: {
    },
    data() {
        return {
            arrTitle: this.titles,
            itemsTables: this.items
        };
    },
    created() {


    },
    mounted() {
    },
    computed: {
    },
    updated() {

    },
    destroyed() {

    },
    methods: {
        searchCellName(record, key) {
            const arrTitle = Object.keys(record)
            arrTitle.forEach(element => {
                if (element == key) {
                    return true;
                }
            });
            return true;
        },

    },
};
</script>

<style>
table {
    border-spacing: 1;
    border-collapse: collapse;
    background: white;
    border-radius: 6px;
    overflow: hidden;
    width: 100%;
    margin: 0 auto;
    position: relative;
}

table * {
    position: relative;
}

table td,
table th {
    padding-left: 3rem;
}

table thead tr {
    height: 60px;
    background: #6c7ae0;
    font-size: 16px;
}

table tbody tr {
    height: 48px;
    border-bottom: 1px solid #E3F1D5;
}

table tbody tr:last-child {
    border: 0;
}

table td,
table th {
    text-align: center;
}

table td.l,
table th.l {
    text-align: right;
}

table td.c,
table th.c {
    text-align: center;
}

table td.r,
table th.r {
    text-align: center;
}

@media screen and (max-width: 35.5em) {
    table {
        display: block;
    }

    table>*,
    table tr,
    table td,
    table th {
        display: block;
    }

    table thead {
        display: none;
    }

    table tbody tr {
        height: auto;
        padding: 8px 0;
    }

    table tbody tr td {
        padding-left: 45%;
        margin-bottom: 12px;
    }

    table tbody tr td:last-child {
        margin-bottom: 0;
    }

    table tbody tr td:before {
        position: absolute;
        font-weight: 700;
        width: 40%;
        left: 10px;
        top: 0;
    }

    table tbody tr td:nth-child(1):before {
        content: "Code";
    }

    table tbody tr td:nth-child(2):before {
        content: "Stock";
    }

    table tbody tr td:nth-child(3):before {
        content: "Cap";
    }

    table tbody tr td:nth-child(4):before {
        content: "Inch";
    }

    table tbody tr td:nth-child(5):before {
        content: "Box Type";
    }
}

blockquote {
    color: white;
    text-align: center;
}
</style>
