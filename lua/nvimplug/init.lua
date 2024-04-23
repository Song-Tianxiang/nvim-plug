local M = {}

M.opts = {
    plug_config_dir = vim.fs.normalize(vim.fn.stdpath('config') .. '/lua/plugins'),
    plug_config_edit_cmd = 'edit',
    plug_config_loadall = true,
}

M.setup = function(plugins, opts)
    require('nvimplug').plug_regist(plugins)

    M.opts = vim.tbl_deep_extend('force', M.opts, opts or {})

    if M.opts.plug_config_loadall then
	M.loadallconfig()
    end

end

return M
