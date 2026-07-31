-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/ for workspace rules

local philips = "desc:Philips Consumer Electronics Company PHL 325E1 0x000024D2"
local hpE273q = "desc:HP Inc. HP E273q 6CM8500M65"

hl.workspace_rule({ workspace = "1", monitor = philips, default = true })
hl.workspace_rule({ workspace = "2", monitor = philips })

hl.workspace_rule({ workspace = "3", monitor = hpE273q, default = true })
hl.workspace_rule({ workspace = "4", monitor = hpE273q })

-- "Smart gaps" / "No gaps when only"
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })

hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" },   border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" },   rounding = 0 })
