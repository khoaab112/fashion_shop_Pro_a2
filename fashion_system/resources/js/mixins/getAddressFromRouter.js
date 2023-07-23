import routers from '@/js/routerVue/index.js';

const router = routers.options.routes;
const paths = {};
for (let value of router) {
    let name = value.name
    let path = value.path
    if (name)
        paths[name] = path;
    if (value.children) {
        for (let child of value.children) {
            let nameChild = child.name
            let pathChild = path + '/' + child.path
            paths[nameChild] = pathChild
        }
    }
}

//get obj  = name : path
export default paths;