-- Alt+Tab window switcher, shown with rofi by scripts/window-switcher.sh.

local vars = require("vars")

local M = {}

local script = "~/.config/hypr/scripts/window-switcher.sh"

-- Hyprland binds take keys before rofi sees them, so the switcher runs in a submap without them.
hl.define_submap("switcher", function()
    -- Escape hatch in case the script fails to reset the submap
    hl.bind(vars.mainMod .. " + ESCAPE", hl.dsp.submap("reset"))
end)

-- Open the switcher; scope is "workspace" or "all", mode is "next", "prev" or "search".
function M.open(scope, mode)
    return function()
        hl.dispatch(hl.dsp.submap("switcher"))
        hl.dispatch(hl.dsp.exec_cmd(script .. " " .. scope .. " " .. mode))
    end
end

return M
