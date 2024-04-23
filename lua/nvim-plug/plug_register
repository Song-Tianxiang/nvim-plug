local M = {}

M.plug_register = function(plugins)
    vim.fn['plug#begin']()

    for plugin in vim.iter(plugins) do
	local plugin_name = ''
	local plugin_opts = {}

	if type(plugin) == 'string' then
	    plugin = { plugin }
	end

	for k, v in pairs(plugin) do
	    if k == 1 or k == 'url' then
		plugin_name = v
	    else
		if k == 'name' then
		    k = 'as'
		elseif k == 'ft' then
		    k = 'for'
		elseif k == 'build' then
		    k = 'do'
		elseif k == 'lock' then
		    k = 'frozen'
		elseif k == 'cmd' then
		    k = 'on'
		end

		plugin_opts[k] = v
	    end
	end

	if not plugin_opts == {} then
	    vim.fn['plug#'](plugin_name, plugin_opts)
	else
	    vim.fn['plug#'](plugin_name)
	end

    end

    vim.fn['plug#end']()
end

return M
