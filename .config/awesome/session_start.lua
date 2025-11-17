local awful = require("awful")
local run = awful.spawn
local shell = awful.spawn.with_shell

shell('monitorLayout')
shell('setxkbmap -layout br,pt')
