/**
 * created by @sanyabeast at 11 dec 2021 / 1:12 am
 * 
 */

const fs = require("fs")
const fs_extra = require("fs-extra")
const path = require("path")
const yamlfile = require("yamlfile")
const jsonfile = require("jsonfile")
const { filter, find, forEach, isObject, isArray, isNumber, isUndefined, isNull, isString, isBoolean } = require("lodash")
const lua_format = require("lua-fmt")
function log() { return console.log(`${new Date()} [retro-psp/utils] [i]`.bgBlack, ...arguments) }

const TEXT_PREPROCESSORS = [
    {
        test: /%APP_NAME%/gm,
        replace: data => data.APP_NAME
    }
]

function _ensure(p) {
    let dirname = path.dirname(p)
    if (!fs.existsSync(dirname)) {
        fs.mkdirSync(dirname, { recursive: true })
    }
    return p
}
function _indent(count = 1) {
    let r = ``
    let s = "  "
    for (let a = 0; a < count; a++) {
        r += s
    }
    return s
}
function _generate_lua_table_code(data, depth = 0) {
    let r = ``
    switch (true) {
        case isObject(data): {
            let lines = []
            forEach(data, (value, key) => {
                lines.push(`${_indent(depth + 1)}[${JSON.stringify(key)}] = ${_generate_lua_table_code(value, depth + 1)}`)
            })
            return `${_indent(depth)}{\n${lines.join(",\n")}\n}`
            break
        }
        case isString(data) || isBoolean(data): {
            return `${_indent(depth + 1)}${JSON.stringify(data)}`
            break
        }
        case isNumber(data): {
            return `${_indent(depth + 1)}${JSON.stringify(data || 0)}`
            break
        }
        default: {
            return `${_indent(depth + 1)}nil`
        }
    }

    return r
}

function _to_lua_table(data) {
    let lua_code = `local __DATA__ = ${_generate_lua_table_code(data)}`
    lua_code = _lint_lua(lua_code).replace("local __DATA__ = ", "")
    return lua_code
}

function _lint_lua(code, file_path) {
    log(`linting lua code...`)
    try {
        return lua_format.formatText(code)
    } catch (err) {
        log(`lintling lua code failed: ${file_path}`.red)
        console.error(err)
    }
    return code
}

function _apply_text_preprocessors(text, vars) {
    forEach(TEXT_PREPROCESSORS, p => {
        text = text.replace(p.test, p.replace({
            ...vars
        }))
    })
    return text
}

module.exports = {
    _ensure: _ensure,
    _to_lua_table: _to_lua_table,
    _lint_lua: _lint_lua,
    TEXT_PREPROCESSORS,
    _apply_text_preprocessors: _apply_text_preprocessors
}