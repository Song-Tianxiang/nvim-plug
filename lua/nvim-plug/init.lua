local M = {}

M.opts = {
    plug_config_dir = vim.fs.normalize(vim.fn.stdpath('config') .. '/lua/plugins'),
    plug_config_edit_cmd = 'edit',
    plug_config_loadall = true,
    plug_config_define_command = true,
}

M.setup = function(plugins, opts)
    M.opts = vim.tbl_deep_extend('force', M.opts, opts or {})
	
    require('nvim-plug.boot_vimplug')

    local plugins = plugins or {}
    table.insert(plugins, 1, { 'Song-Tianxiang/nvim-plug', dir = vim.fs.normalize(vim.fn.stdpath('data') .. '/nvim-plug/nvim-plug') } )
    table.insert(plugins, 2, { 'junegunn/vim-plug' } )
    require('nvim-plug.plug_register').plug_register(plugins, plug_config_plug_home)
	if vim.g.plug_config_bootstrap then
		vim.cmd[[ PlugInstall --sync ]]
		require('nvim-plug.plug_register').plug_register(plugins, plug_config_plug_home) ]]
	end

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
		require('nvim-plug.load_config').edit_config(opts.args)
	end,
	{
	nargs = 1,
	complete = function(A, L, C)
		return require('nvim-plug.load_config').plugs()
	end,
	}
    )
end


return M
