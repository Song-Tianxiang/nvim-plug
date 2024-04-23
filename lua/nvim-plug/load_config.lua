local M = {}

local opts = require('nvim-plug').opts

M.pluglist = vim.fn.reverse(vim.fn.deepcopy(vim.g.plugs_order))

M.config_path = function(plug)
    local filename = plug .. '.lua'
    return vim.fs.normalize(opts.plug_config_dir) .. '/' .. filename 
end


M.plugs = function()
    return vim.fn.join(M.pluglist, '\n')
end

M.edit_config = function(plug)
    local path = M.config_path(plug)
    
    vim.cmd(opts.plug_config_edit_cmd .. " " .. path)
end

M.load_config = function(plug)
    local path = M.config_path(plug)
    if not vim.fn.empty(vim.fn.glob(path)) then
	vim.cmd("source " .. path)
    end
end

M.load_all_config = function()
    for plug in vim.iter(M.pluglist) do
	M.load_config(plug)
    end
end

return M
