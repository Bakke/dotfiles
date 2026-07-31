-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0",       scale = 1 })
hl.monitor({ output = "DP-1",  mode = "preferred", position = "auto-left", scale = 1 })
hl.monitor({ output = "DP-2",  mode = "preferred", position = "auto-left", scale = 1 })
hl.monitor({ output = "DP-3",  mode = "preferred", position = "auto-left", scale = 1 })
hl.monitor({ output = "DP-5",  mode = "preferred", position = "auto-left", scale = 1 })

-- DP-4
hl.monitor({
    output   = "desc:Philips Consumer Electronics Company PHL 325E1 0x000024D2",
    mode     = "preferred",
    position = "-2560x0",
    scale    = 1,
})

-- DP-3
hl.monitor({
    output    = "desc:HP Inc. HP E273q 6CM8500M65",
    mode      = "preferred",
    position  = "-4000x-630",
    scale     = 1,
    transform = 1,
})

-- DP-1
hl.monitor({
    output   = "desc:Hewlett Packard HP 27cw 6CM5091Z7K",
    mode     = "preferred",
    position = "1920x0",
    scale    = 1,
})
