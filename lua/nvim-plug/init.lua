local M = {}

M.opts = {
    plug_config_dir = vim.fs.normalize(vim.fn.stdpath('config') .. '/lua/plugins'),
    plug_config_edit_cmd = 'edit',
    plug_config_loadall = true,
    plug_config_define_command = true,
}

M.setup = function(plugins, opts)
    require('nvim-plug.boot_vimplug')

    local plugins = plugins or {}
    table.insert(plugins, 1, { 'Song-Tianxiang/nvim-plug' } )
    require('nvim-plug.plug_register').plug_register(plugins)

    M.opts = vim.tbl_deep_extend('force', M.opts, opts or {})

    if M.opts.plug_config_loadall then
	require('nvim-plug.load_config').load_all_config()
    end

    if M.opts.plug_config_define_command then
	M.define_command()
    end
end

M.define_command = function()
    vim.api.nvim_create_user_command('PlugConfig',
	function(opts)
	    if opts.nargs ~= 1 then
		vim.notify("Only 1 argument can be accepted!", vim.log.levels.ERROR)
	    else
		require('nvim-plug').edit_config(opts.args)
	    end
	end,
	{complete = require('nvim-plug.load_config').plugs()}
    )
end


return M
