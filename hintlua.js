const lua_parser = require("luaparse")
const { _ensure, _to_lua_table, _format_lua, _apply_text_preprocessors, _traverse } = require('./utils')
const { get, forEach } = require("lodash")
function log() { return console.log(`${new Date()} [retro-psp/hintlua] [i]`.magenta, ...arguments) }
function logerr() { return console.log(`${new Date()} [retro-psp/hintlua] [!]`.bgRed, ...arguments) }

let luaparse_opts = {
    locations: true
}

function _make_code_debug_error(node_data) {
    let lines = node_data.lua_code.split("\n")
    // console.log(lines)
    let err_line = node_data.node.loc.start.line - 1
    let start_line = Math.max(0, err_line - 3)
    let end_line = Math.min(lines.length, node_data.node.loc.end.line + 3)
    lines[err_line] = `[ERROR] -> ${lines[err_line]}`
    let r_lines = lines.slice(start_line, end_line)
    return [`FILE: "${node_data.resource_path}"`.cyan, '...', ...r_lines, '...'].join("\n")
}
const checks = {
    self_method_calling_with_dot_indexer: {
        test(node_data) {
            return get(node_data, "node.type") === "CallExpression" &&
                get(node_data, "node.base.type") === "MemberExpression" &&
                get(node_data, "node.base.base.name") === "self" &&
                get(node_data, "node.base.indexer") === "."
        },
        warning: node_data => [`CallExpression: calling self method with dot (.) indexer\n`.red, _make_code_debug_error(node_data)]
    }
}
// hint(`keks = 1`, { debug: true })
function hint(lua_code, { resource_path, debug }) {
    log(`hinting: ${resource_path}`)
    let ast = undefined
    try {
        ast = lua_parser.parse(lua_code, luaparse_opts)
    } catch (err) {
        logerr(`\nerror parsing "${resource_path}": ${err.message}`.red)
        console.error(err)
        return
    }

    if (debug) console.log(JSON.stringify(ast, null, "\t"))
    _traverse(ast, (node, name, parent) => {
        let node_data = {
            node,
            name,
            parent,
            lua_code: lua_code,
            resource_path: resource_path
        }
        forEach(checks, (check_data, index) => {
            if (check_data.test(node_data)) {
                logerr('\n', ...check_data.warning(node_data))
            }
        })
    })
    return lua_code
}

module.exports = hint