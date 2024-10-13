if not package.loaded['CopilotChat'] then
    return
end

require("CopilotChat").setup {
    debug = false,
}
