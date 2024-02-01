-- main module file
local module = require("json-to-ts.module")
---@class Config
---@field opt string Your config option
--INFO: The Hello here prints when opt is passed as empty as this is the default config.
local config = {
  opt = "Hello!",
}

---@class MyModule
local M = {}

---@type Config
M.config = config

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
  --INFO: This is a keymap i am sending forward and this one prints what i pass in the function "REdox Welcome in this case."
  --
  -- vim.keymap.set("n", "<Leader>cu", function()
  --   module.greeting("REdox welcome")
  -- end, { desc = "Test mE!" })
  --
  -- vim.keymap.set("n", "<Leader>cu", function()
  --   module.currentBuftext()
  -- end, { desc = "print current text in buffer" })
end

M.hello = function()
  return module.greeting(M.config.opt)
end
M.AutoBuf = function()
  return module.currentBuftext()
end

return M
