-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch.

local vars = require("vars")

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("nm-applet --indicator --no-agent")
    -- hl.exec_cmd("systemctl --user start plasma-polkit-agent")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("swaync")
    -- hl.exec_cmd("~/.config/hypr/scripts/vertical-monitor.sh")
    -- hl.exec_cmd("firefox", { workspace = "1" })
    hl.exec_cmd("brave", { workspace = "1" })
    hl.exec_cmd(vars.terminal, { workspace = "2 silent" })
end)
