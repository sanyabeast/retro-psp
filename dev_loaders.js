/**
 * Created by @sanyabeast 
 * 10 dec 2021 / 10:58
 */

const fs = require("fs")
const fs_extra = require("fs-extra")
const path = require("path")
const yamlfile = require("yamlfile")
const jsonfile = require("jsonfile")
const colors = require("colors")
const { forEach } = require("lodash")
const { _ensure, _to_lua_table, _lint_lua, _apply_text_preprocessors } = require('./utils')
function log() { return console.log(`${new Date()} [retro-psp/loaders] [i]`.bgMagenta, ...arguments) }




function png_loader(data) {
    console.log(`loader in work`)
    console.dir(data)
}
function yaml_loader({ deleted, root, dist_path, resource_path, APP_NAME, event_data }) {
    log(`transforming yaml file: ${resource_path}`)
    if (deleted) {
        if (fs.existsSync(path.resolve(dist_path, resource_path))) {
            fs.rmSync(path.resolve(dist_path, resource_path))
        }
        return
    }
    let file_data = yamlfile.readFileSync(path.resolve(root, resource_path))
    let lua_table_code = _to_lua_table(file_data)
    lua_table_code = _apply_text_preprocessors(lua_table_code, {
        deleted,
        root,
        dist_path,
        APP_NAME,
    })
    let lua_code = [
        `local data = ${lua_table_code}`,
        `return data`

    ].join("\n")
    /** */
    fs.writeFileSync(_ensure(path.resolve(dist_path, resource_path.replace(/\.yaml$/, ".lua"))), lua_code)
}

function lua_loader({ deleted, root, dist_path, resource_path, APP_NAME, event_data }) {
    log(`loading lua script file: ${resource_path}`)
    if (deleted) {
        if (fs.existsSync(path.resolve(dist_path, resource_path))) {
            fs.rmSync(path.resolve(dist_path, resource_path))
        }
        return
    }
    let file_data = fs.readFileSync(path.resolve(root, resource_path), { encoding: "utf-8" })
    file_data = _apply_text_preprocessors(file_data, {
        deleted,
        root,
        dist_path,
        APP_NAME,
    })

    let lua_code = _lint_lua(file_data, resource_path)
    /** */
    fs.writeFileSync(_ensure(path.resolve(dist_path, resource_path)), lua_code)
}
function copy_loader({ deleted, root, dist_path, resource_path, APP_NAME, event_data }) {
    if (deleted) {
        if (fs.existsSync(path.resolve(dist_path, resource_path))) {
            fs.rmSync(path.resolve(dist_path, resource_path))
        }
        return
    }
    /** */
    // log(`copying file: ${resource_path}`)
    fs.copyFileSync(
        _ensure(path.resolve(root, resource_path)),
        _ensure(path.resolve(dist_path, resource_path))
    )
}
module.exports = {
    png_loader: png_loader,
    copy_loader: copy_loader,
    yaml_loader: yaml_loader,
    lua_loader: lua_loader
}