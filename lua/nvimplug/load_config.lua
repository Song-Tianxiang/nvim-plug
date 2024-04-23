local M = {}

local opts = require('nvimplug').opts

M.pluglist = vim.fn.reverse(vim.fn.deepcopy(vim.g.plugs_order))

M.config_path = function(plug)
    local filename = plug .. '.lua'
    return vim.fs.normalize(opts.plug_config_dir) .. '/' .. filename 
end


M.plugs = function()
    return vim.fn.join(M.pluglist, '\n')
end

M.editconfig = function(plug)
    local path = M.config_path(plug)
    
    vim.cmd(opts.plug_config_edit_cmd .. " " .. path)
end

M.loadconfig = function(plug)
    local path = M.config_path(plug)
    if vim.uv.fs_stat(path) then
	vim.cmd("source " .. path)
    end
end

M.loadallconfig = function()
    for plug in vim.iter(M.pluglist) do
	M.loadconfig(plug)
    end
end

return M
