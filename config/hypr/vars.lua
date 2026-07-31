-- Shared values used across the config modules.
-- Replaces hyprlang's `$var` globals, which lua has no equivalent for.

return {
    terminal    = "alacritty",
    fileManager = "nautilus",
    menu        = 'rofi -show drun -kb-secondary-copy "" -kb-custom-1 Ctrl+c -emoji-mode copy',

    mainMod   = "SUPER", -- Sets "Windows" key as main modifier
    secondMod = "ALT",   -- Sets "Alt" key as second modifier
}
