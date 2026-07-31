-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/ for more

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "tile-brave-devtools",
    match = { class = "Brave-browser", title = "DevTools.*" },
})

hl.window_rule({
    name  = "tile-wine-virtual-desktop",
    match = { class = "Wine", title = "virtual - Wine desktop" },
})

hl.window_rule({
    name  = "float-1password-quickaccess",
    match = { class = "1Password", title = "Quick Access — 1Password" },

    float        = true,
    center       = true,
    no_blur      = true,
    stay_focused = true,
    allows_input = true,
})

hl.window_rule({
    name  = "rofi-stay-focused",
    match = { class = "Rofi" },

    stay_focused = true,
})

hl.window_rule({
    name  = "ueberzugpp",
    match = { class = "ueberzugpp.*" },

    float       = true,
    no_blur     = true,
    no_anim     = true,
    no_shadow   = true,
    border_size = 0,
    pin         = false,
    no_focus    = true,
})
