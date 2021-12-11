/**
 * Created by @sanyabeast 
 * 10 dec 2021 / 10:57
 */

const yamlfile = require("yamlfile")
const jsonfile = require("jsonfile")
const fs = require("fs")
const fs_extra = require("fs-extra")
const path = require("path")
const root = path.resolve(__dirname)
const chokidar = require('chokidar');
const color = require("colors")
const { filter, find, forEach } = require("lodash")
const { _ensure } = require('./utils')

/**cli args parsing */
const args = require("args-parser")(process.argv)
const APP_NAME = args.app
const APP_DIST_PATH = path.resolve(root, `dist/${APP_NAME}`)
/**importing loaders */
const {
    png_loader,
    copy_loader,
    yaml_loader,
    lua_loader
} = require("./dev_loaders")

/**basic helpers */
function log() { return console.log(`${new Date()} [retro-psp/dev] [i]`.magenta, ...arguments) }
function resolve() { return path.resolve(root, ...arguments) }
function read_txt(p) { return fs.readFileSync(resolve(p), { encoding: "utf-8" }) }
function escape_restring(string) { return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'); }

/**setting up loading */
const watchers = {}
const loading_config = {
    rules: [
        {
            test: /\.png$/,
            use: copy_loader
        },
        {
            test: /\.jpg$/,
            use: copy_loader
        },
        {
            test: /\.obj$/,
            use: copy_loader
        },
        {
            test: /\.mtl$/,
            use: copy_loader
        },
        {
            test: /\.lua$/,
            use: lua_loader
        },
        {
            test: /\.yaml$/,
            use: yaml_loader
        },
        {
            test: /\.grid$/,
            use: copy_loader
        },
        {
            test: /\.pgf$/,
            use: copy_loader
        }
    ]
}
function get_loading_rule(resource_path) {
    let r = find(loading_config.rules, r => resource_path.match(r.test) != null)
    return r
}

/**source wathing */
function watch_directory(module_name) {
    let module_path = path.join(root, module_name)
    log(`start watching "${module_path}"...`.green)
    let w = watchers[module_name] = chokidar.watch(module_path, {
        persistent: true,
        ignored: '*.txt',
        ignoreInitial: false,
        followSymlinks: true,
        cwd: '.',
        disableGlobbing: false,
        usePolling: false,
        interval: 100,
        binaryInterval: 300,
        alwaysStat: false,
        depth: 99,
        awaitWriteFinish: {
            stabilityThreshold: 2000,
            pollInterval: 100
        },
        ignorePermissionErrors: false,
        atomic: true // or a custom 'atomicity delay', in milliseconds (default 100)
    });

    w.on('add', handle_fs_add)
    w.on('change', handle_fs_change)
    w.on('unlink', handle_fs_unlink)
    w.on('addDir', handle_fs_add_dir)
    w.on('unlinkDir', handle_fs_unlink_dir)
}
function watch_index() {
    let w = watchers.__index = chokidar.watch(resolve(`main`, "main.lua"));
    w.on('add', spawn_index)
    w.on('change', spawn_index)
}
function clear_dist() { fs_extra.emptyDirSync(APP_DIST_PATH); }

/**fs watcher callbacks */
function handle_fs_add(resource_path, event_data) {
    return handle_fs_change(resource_path, event_data)
}
function handle_fs_change(resource_path, event_data) {
    // log(`resource changed: ${resource_path}`)
    let rule = get_loading_rule(resource_path)
    if (rule) {
        let loader = rule.use
        loader({
            APP_NAME: APP_NAME,
            root: root,
            dist_path: APP_DIST_PATH,
            resource_path: resource_path,
            event_data: event_data
        })
    } else {
        log(`ignoring: ${resource_path}`.yellow)
    }
}
function handle_fs_unlink(resource_path, event_data) {
    let rule = get_loading_rule(resource_path)
    if (rule) {
        let loader = rule.use
        loader({
            APP_NAME: APP_NAME,
            root: root,
            dist_path: APP_DIST_PATH,
            resource_path: resource_path,
            event_data: event_data,
            deleted: true
        })
    } else {
        log(`ignoring: ${resource_path}`.yellow)
    }
}
function handle_fs_add_dir(resource_path, event_data) { }
function handle_fs_unlink_dir(resource_path, event_data) { }

function inject_to_lua(src = "", placeholder = "", injection = "", before = false) {
    let placeholder_comment = `-- [${placeholder.toUpperCase()}]`
    let re = new RegExp(escape_restring(placeholder_comment), "gmi")
    return before ? src.replace(re, `${injection}\n${placeholder_comment}`) : src.replace(re, `${placeholder_comment}\n${injection}`)
}
function spawn_index(resource_path, event_data) {
    log(`updating index`.yellow)
    let tpl = read_txt(resolve(resource_path))
    let r = inject_to_lua(tpl, "begin", `APP_NAME = "${APP_NAME}"`)
    r = inject_to_lua(r, "app_prepare", `dofile("apps/${APP_NAME}/index.lua")`)
    fs.writeFileSync(path.resolve(APP_DIST_PATH, "SCRIPT.LUA"), r, { encoding: "utf-8" })

}
/**checking if app exist or we need to create a new one */


/**creating application`s dist directory or emptying existong one on starup*/
if (fs.existsSync(APP_DIST_PATH)) {
    log(`emptying applications dist directory`.green)
    clear_dist()
} else {
    log(`creating applications dist directory`.green)
    fs.mkdirSync(APP_DIST_PATH)
}
/**copying onelua`s binary into app`s dist dir */
try {
    fs.copyFileSync(resolve(`main`, "onelua.pbp"), resolve(APP_DIST_PATH, "EBOOT.PBP"))
} catch (err) {
    if (err.code !== "EBUSY") {
        throw (err)
    } else {
        log(`Skipping copying onelua's binary as it is busy for now. May be you are running it with PPSSPP, check it up ;)`.yellow)
    }
}
fs.copyFileSync(resolve(`main`, "oneFont.pgf"), resolve(APP_DIST_PATH, "oneFont.pgf"))
/**begining to watch core and apps directories. probably for (((production)))  using there must be not engine`s core source watching buttttttt.....*/
watch_directory("retro")
watch_directory(`apps/${APP_NAME}`)
/**specially organized processing of mutations of index file (script.lua) */
watch_index()
log(`seems like everything works fine. good luck have fun ;)`.toUpperCase().cyan)