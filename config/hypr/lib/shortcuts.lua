-- Helpers that send key shortcuts to the active window.

local M = {}

-- send_shortcut resolves its `key` by scanning the keymap with xkb_state_key_get_one_sym,
-- which honours whatever modifiers are physically held at dispatch time. While SHIFT is
-- down - as it always is for the ALT+SHIFT+H/L binds - the Tab keycode reports
-- ISO_Left_Tab instead of Tab, so a "Tab" lookup fails with "send_shortcut: key not found".
-- Hyprland caches successful lookups per keyboard, which is why pressing a non-SHIFT tab
-- bind once used to "prime" the SHIFT ones for the rest of the session.
-- Retrying under the shifted keysym name makes them work from a cold session.
function M.tabSwitch(mods)
    return function()
        local r = hl.dispatch(hl.dsp.send_shortcut({ mods = mods, key = "Tab" }))
        if not (r and r.ok) then
            hl.dispatch(hl.dsp.send_shortcut({ mods = mods, key = "ISO_Left_Tab" }))
        end
    end
end

-- Send `key` to the active window, unless it is `exceptClass` - then send `altKey` instead.
function M.sendKeyUnless(mods, key, altMods, altKey, exceptClass)
    return function()
        local w = hl.get_active_window()
        if w and w.class == exceptClass then
            hl.dispatch(hl.dsp.send_shortcut({ mods = altMods, key = altKey }))
        else
            hl.dispatch(hl.dsp.send_shortcut({ mods = mods, key = key }))
        end
    end
end

return M
