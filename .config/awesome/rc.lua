-- If LuaRocks is installed, make sure that packages installed through it are found
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

require("core.error_handling")
require("awful.autofocus")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

RC = {} -- global namespace
RC.vars = require("user_config")

-- stylua: ignore
-- used in core/menu and menuitems
function IN_TERM(cmd) return RC.vars.terminal .. " -e " .. cmd end

RC.layouts = require("core.layouts")
RC.mainmenu = require("core.menu")
RC.rules = require("core.rules")

local bg = require("core.bindings.global")
local bc = require("core.bindings.client")

RC.bindings = {
	globalkeys = bg.keys,
	globalbuttons = bg.buttons,
	clientbuttons = bc.buttons,
	clientkeys = bc.keys,
}

local bindtotags = require("core.bindings.bindtotags")
RC.bindings.globalkeys = bindtotags(RC.bindings.globalkeys)

root.keys(RC.bindings.globalkeys)
root.buttons(RC.bindings.globalbuttons)

awful.rules.rules = RC.rules(RC.bindings.clientkeys, RC.bindings.clientbuttons)

-- apply decorations
require("deco.titlebar")
require("deco.statusbar")

require("core.signals")
