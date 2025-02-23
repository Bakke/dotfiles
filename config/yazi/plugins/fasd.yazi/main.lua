local function entry()
    local value, event = ya.input({
        title = "Jump to dir:",
        position = { "center", w = 50 },
    })

    if event == 1 then
        local output, err = Command("fasd"):args({ "-d", "-1", value }):output()

        if err then
            ya.notify {
                title = "Jump to dir",
                content = string.format("Jump to directory failed, error: %s", err),
                level = "error",
                timeout = 5,
            }
        end

        local folder = string.gsub(output.stdout, "\n", "")

        ya.manager_emit("cd", {
            folder
        })
    end
end

return { entry = entry }
