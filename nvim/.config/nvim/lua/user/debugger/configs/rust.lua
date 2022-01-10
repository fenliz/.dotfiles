local extension_path = '/home/charlie/.vscode/extensions/vadimcn.vscode-lldb-1.6.10'
local codelldb_path = extension_path .. '/adapter/codelldb'
local liblldb_path = extension_path .. '/lldb/lib/liblldb.so'

return {
    adapter = require'rust-tools.dap'.get_codelldb_adapter(codelldb_path, liblldb_path)
}
