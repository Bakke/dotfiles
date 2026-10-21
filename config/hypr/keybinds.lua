-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local vars      = require("vars")
local groups    = require("lib.groups")
local switcher  = require("lib.switcher")
local shortcuts = require("lib.shortcuts")

local mainMod   = vars.mainMod
local secondMod = vars.secondMod

hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprctl reload"))

hl.bind(mainMod .. " + RETURN",  hl.dsp.exec_cmd(vars.terminal))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("rofi -show poweroff"))

hl.bind("CTRL + SHIFT + L", hl.dsp.exec_cmd("1password --lock"))
hl.bind("SHIFT + ALT + SPACE", hl.dsp.exec_cmd("1password --quick-access"))

-- SUPER + ESCAPE toggles passthrough for all binds
hl.bind(mainMod .. " + ESCAPE", hl.dsp.submap("passthrough"))
hl.define_submap("passthrough", function()
    hl.bind(mainMod .. " + ESCAPE", hl.dsp.submap("reset"))
end)

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- SIGTERM the process owning the window (window.kill() would SIGKILL it)
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.signal({ signal = 15 }))
hl.bind(mainMod .. " + " .. secondMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(vars.fileManager))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("swaync-client -C"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
-- hl.bind(mainMod .. " + P", hl.dsp.layout("togglesplit")) -- dwindle
hl.bind(secondMod .. " + space", hl.dsp.exec_cmd(vars.menu))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("killall waybar || waybar"))

-- Maximize window
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))

-- Group all tiled windows on the active workspace into tabs, or ungroup them
hl.bind(mainMod .. " + M", groups.toggleWorkspaceGroup)

-- Switch between windows on the active workspace, most recent first
hl.bind(secondMod .. " + TAB",         switcher.open("workspace", "next"))
hl.bind(secondMod .. " + SHIFT + TAB", switcher.open("workspace", "prev"))

-- Switch between windows on all workspaces
hl.bind(mainMod .. " + TAB",         switcher.open("all", "next"))
hl.bind(mainMod .. " + SHIFT + TAB", switcher.open("all", "prev"))

-- Move windows with mainMod + SHIFT + arrow keys or hjkl, in and out of groups
-- Move focus with mainMod + arrow keys or hjkl
-- Resize windows with mainMod + CTRL + arrow keys or hjkl
local directions = {
    { arrow = "left",  letter = "H", dir = "l", x = -50, y = 0 },
    { arrow = "right", letter = "L", dir = "r", x = 50,  y = 0 },
    { arrow = "up",    letter = "K", dir = "u", x = 0,   y = -50 },
    { arrow = "down",  letter = "J", dir = "d", x = 0,   y = 50 },
}

for _, d in ipairs(directions) do
    for _, key in ipairs({ d.arrow, d.letter }) do
        hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = d.dir, group_aware = true }))
        hl.bind(mainMod .. " + CTRL + " .. key,
            hl.dsp.window.resize({ x = d.x, y = d.y, relative = true }), { repeating = true })
        hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = d.dir }))
    end
end

-- Move and resize windows with SUPER + mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Scroll through existing workspaces with secondMod + ctrl + [J/K]
hl.bind(secondMod .. " + CTRL + K", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(secondMod .. " + CTRL + J", hl.dsp.focus({ workspace = "r-1" }))
hl.bind("mouse:276", hl.dsp.focus({ workspace = "r+1" }))
hl.bind("mouse:275", hl.dsp.focus({ workspace = "r-1" }))

-- Move active window to a workspace with secondMod + ctrl + [H/L]
hl.bind(secondMod .. " + CTRL + L", groups.moveToWorkspace("r+1"))
hl.bind(secondMod .. " + CTRL + H", groups.moveToWorkspace("r-1"))

-- Move active workspace to right/left monitor with mainMod + shift + ctrl + [H/L]
hl.bind(mainMod .. " + CTRL + SHIFT + H", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind(mainMod .. " + CTRL + SHIFT + L", hl.dsp.workspace.move({ monitor = "r" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,           hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,   groups.moveToWorkspace(i))
end

-- Special workspace (scratchpad).
-- Both binds must target the *unnamed* special workspace (id -99). Passing "special" to
-- toggle_special would open the *named* `special:special` (id -98) instead, which is a
-- different workspace than the one `move` sends windows to.
hl.bind(mainMod .. " + S", groups.moveToWorkspace("special"))
hl.bind("CTRL + " .. secondMod .. " + space", hl.dsp.workspace.toggle_special())

-- Tab navigation for all applications
hl.bind(mainMod .. " + " .. secondMod .. " + right", shortcuts.tabSwitch("CTRL"))
hl.bind(mainMod .. " + " .. secondMod .. " + left",  shortcuts.tabSwitch("CTRL + SHIFT"))
hl.bind(secondMod .. " + SHIFT + L", shortcuts.tabSwitch("CTRL"))
hl.bind(secondMod .. " + SHIFT + H", shortcuts.tabSwitch("CTRL + SHIFT"))

-- Use Alt+[H/J/K/L] for Left/Down/Up/Right in all applications (except Alacritty)
hl.bind(secondMod .. " + K", shortcuts.sendKeyUnless("", "Up",    "ALT", "K", "Alacritty"), { repeating = true })
hl.bind(secondMod .. " + J", shortcuts.sendKeyUnless("", "Down",  "ALT", "J", "Alacritty"), { repeating = true })
hl.bind(secondMod .. " + H", shortcuts.sendKeyUnless("", "Left",  "ALT", "H", "Alacritty"), { repeating = true })
hl.bind(secondMod .. " + L", shortcuts.sendKeyUnless("", "Right", "ALT", "L", "Alacritty"), { repeating = true })

-- Color picker
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("hyprpicker -f hex - | wl-copy -n"))

-- Screenshot binds
local screenshotPath = [==[SCREENSHOT_PATH="${HOME}/Pictures/screenshots/$(date +'screenshot_%F-%T').png"]==]
local activeMonitor  = [==[$(hyprctl activeworkspace -j | jq '.monitor' | tr -d '"')]==]
local activeGeometry = [==["$(hyprctl activewindow -j | jq -r '[(.at | join(",")), (.size | join("x"))] | join(" ")')"]==]
local openInKsnip    = [==[([[ -n $(command -v ksnip) ]] && ksnip $SCREENSHOT_PATH)]==]

-- Monitor
hl.bind("CTRL + ALT + 2",
    hl.dsp.exec_cmd(screenshotPath .. " && grim -o " .. activeMonitor .. " $SCREENSHOT_PATH && " .. openInKsnip))
hl.bind("CTRL + ALT + SHIFT + 2",
    hl.dsp.exec_cmd("grim -o " .. activeMonitor .. " - | wl-copy"))

-- Active window
hl.bind("CTRL + ALT + 3",
    hl.dsp.exec_cmd(screenshotPath .. " && grim -g " .. activeGeometry .. " $SCREENSHOT_PATH && " .. openInKsnip))
hl.bind("CTRL + ALT + SHIFT + 3",
    hl.dsp.exec_cmd("grim -g " .. activeGeometry .. " - | wl-copy"))

-- Selection
hl.bind("CTRL + ALT + 4",
    hl.dsp.exec_cmd(screenshotPath .. [==[ && grim -g "$(slurp)" $SCREENSHOT_PATH && ]==] .. openInKsnip))
hl.bind("CTRL + ALT + SHIFT + 4",
    hl.dsp.exec_cmd([==[grim -g "$(slurp -d)" - | wl-copy]==]))

-- Lock when lid is closed
hl.bind("switch:Lid Switch",
    hl.dsp.exec_cmd("(pidof hyprlock || hyprlock) & systemctl suspend"), { locked = true })

-- Media and volume keys
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"), { repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set 10%+"), { repeating = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
    { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { repeating = true, locked = true })
hl.bind("XF86AudioMute",    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),   { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

-- Requires playerctl
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"),       { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),       { locked = true })
