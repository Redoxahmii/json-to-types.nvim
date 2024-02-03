local helper = require("json-to-ts.helper")
---@class CustomModule
local M = {}

M.write_types = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local file_name = vim.api.nvim_buf_get_name(bufnr)
  local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
  local buffer_to_string = function()
    if filetype == "json" then
      local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
      return table.concat(content, "\n")
    else
      vim.notify("File is not json")
    end
  end
  local text = buffer_to_string()
  local file_path = "./test.txt"
  local file = io.open(file_path, "w+")
  if file then
    file:write(text)
    file:close()
    helper.types_output(file_name)
    os.remove(file_path)
  else
    print("ERROR: Something went wrong")
  end
end

--- [TODO: implment opening as a read only buffer]

-- M.currentBuftext2 = function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local file_name = vim.api.nvim_buf_get_name(bufnr)
--   local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
--   local buffer_to_string = function()
--     if filetype == "json" then
--       local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
--       return table.concat(content, "\n")
--     else
--       vim.notify("File is not json")
--     end
--   end
--   local text = buffer_to_string()
--   -- local prod_path = "/home/redox/.local/share/nvim/json-to-ts.nvim"
--   local file_path = "./test.txt"
--   local file = io.open(file_path, "w+")
--   if file then
--     file:write(text)
--     file:close()
--     local types = helper.types_output(file_name)
--     print("Text has been written to the file: " .. file_path)
--     os.remove(file_path)
--     local buffer_number = -1
--     if buffer_number == -1 then
--       vim.api.nvim_command("botright vnew")
--       buffer_number = vim.api.nvim_get_current_buf()
--     end
--     vim.api.nvim_buf_set_option(buffer_number, "filetype", "typescript")
--     local lines = vim.split(types, "\n")
--     vim.api.nvim_buf_set_lines(buffer_number, 0, -1, false, lines)
--     vim.api.nvim_buf_set_option(buffer_number, "modifiable", false)
--     return types
--   else
--     print("Error: Unable to open the file for writing")
--     return "Error: Unable to open the file for writing"
--   end
-- end

return M
