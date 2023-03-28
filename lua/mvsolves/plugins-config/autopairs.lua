local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
	print("nvim-autopairs did not load correctly")
	return
end


npairs.setup ({
--[[
  check_ts = true,
  ts_config = {
    lua = {'string'}, -- disable autopairs for lua strings
		python = {'#'},
    javascript = {'template_string'},
    java = false, -- don't add pairs for java methods
  },
]]
	disable_filetype	 = { "", },
  ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol

})

-- npairs.remove_rule('(') -- remove rule (
