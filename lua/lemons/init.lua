---@module "lemons"
local M = {}
local config = require("lemons.config")

---@param opts lemons.Configuration
function M.load(opts)
    vim.cmd.highlight("clear")
    vim.cmd.syntax("reset")

    vim.o.termguicolors = true
    vim.o.background = "dark"
    vim.g.colors_name = "lemons"

    opts = M.setup(opts)
    local colors = require("lemons.colors")

    ---@cast opts.overrides {[string]: string}
    for color, value in pairs(opts.overrides) do
        colors[color] = value
    end

    require("lemons.highlights").set(colors)
end

M.setup = config.setup

return M
