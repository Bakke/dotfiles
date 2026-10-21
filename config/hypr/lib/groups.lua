-- Workspace-wide tabbed groups, used as a stand-in for minimizing windows.
-- See https://wiki.hypr.land/Configuring/Basics/Dispatchers/#grouped-tabbed-windows

local M = {}

-- Group all tiled windows on the active workspace into one tabbed group, or dissolve its groups.
function M.toggleWorkspaceGroup()
    local ws = hl.get_active_workspace()
    if not ws then return end

    local tiled, grouped = {}, nil
    for _, w in ipairs(hl.get_workspace_windows(ws.id)) do
        if not w.floating then
            table.insert(tiled, w)
            grouped = grouped or (w.group and w)
        end
    end

    if grouped then
        -- Toggling a grouped window dissolves its whole group; repeat for any other group.
        while grouped do
            hl.dispatch(hl.dsp.group.toggle({ window = grouped }))
            grouped = nil
            for _, w in ipairs(tiled) do
                if w.group then grouped = w break end
            end
        end
        return
    end

    if #tiled == 0 then return end
    local active = hl.get_active_window()
    local base = (active and not active.floating and active.workspace and active.workspace.id == ws.id) and active or tiled[1]
    hl.dispatch(hl.dsp.group.toggle({ window = base }))
    for _, w in ipairs(tiled) do
        if w.address ~= base.address then base.group:add(w) end
    end
    -- add() shows the added window but leaves focus on base, so refocus to show and highlight it
    hl.dispatch(hl.dsp.focus({ window = base }))
end

-- Move the active window to a workspace. A grouped window leaves its group first, since
-- window.move() would otherwise take the whole group along.
function M.moveToWorkspace(workspace)
    return function()
        local w = hl.get_active_window()
        if w and w.group and w.group.size > 1 then
            hl.dispatch(hl.dsp.window.move({ out_of_group = true }))
        end
        hl.dispatch(hl.dsp.window.move({ workspace = workspace }))
    end
end

return M
