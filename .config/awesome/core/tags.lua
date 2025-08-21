local awful = require("awful")
local config = require("user_config")

local _M = {}

local tags = {}
for i = 1, config.tags_per_screen do
	tags[i] = tostring(i)
end

awful.screen.connect_for_each_screen(function(s)
	-- Each screen has its own tag table.
	_M[s] = awful.tag(tags, s, RC.layouts[config.default_layout])
end)

return _M
