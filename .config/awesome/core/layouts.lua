local awful = require("awful")

-- Table of layouts to cover with awful.layout.inc, order matters.
-- stylua: ignore
return {
	awful.layout.suit.floating,       -- 1:

	awful.layout.suit.tile,           -- 2:
	awful.layout.suit.tile.bottom,    -- 3:
	awful.layout.suit.spiral,         -- 4:

	awful.layout.suit.max,            -- 5:
	awful.layout.suit.max.fullscreen, -- 6:
	awful.layout.suit.magnifier,      -- 7:

	--[[
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.top,
	awful.layout.suit.fair,
	awful.layout.suit.fair.horizontal,
	awful.layout.suit.spiral.dwindle,
	awful.layout.suit.corner.nw,
	awful.layout.suit.corner.ne,
	awful.layout.suit.corner.sw,
	awful.layout.suit.corner.se,
	]]
}
