local helper = require("json-to-ts.helper")
-- TODO: Remove deprecated functions

---@class CustomModule
local M = {}

M.write_types = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local file_name = vim.api.nvim_buf_get_name(bufnr)

  local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
  local buffer_to_string = function()
    if filetype == "json" then
      local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
      return table.concat(content, "\n")
    else
      vim.notify("File is not json")
      return
    end
  end
  local text = buffer_to_string()
  if not text then
    return
  end
  local file_path = "./test.txt"
  local file = io.open(file_path, "w+")
  vim.notify("Hello nightly")
  if file then
    file:write(text)
    file:close()
    helper.types_output(file_name)
    os.remove(file_path)
  else
    print("ERROR: Something went wrong")
  end
end

M.write_types_buffer = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local file_name = vim.api.nvim_buf_get_name(bufnr)
  local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
  local buffer_to_string = function()
    if filetype == "json" then
      local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
      return table.concat(content, "\n")
    else
      vim.notify("File is not json")
    end
  end
  local text = buffer_to_string()
  if not text then
    return
  end
  local file_path = "./test.txt"
  local file = io.open(file_path, "w+")
  if file then
    file:write(text)
    file:close()
    local types = helper.types_output_buffer(file_name)
    os.remove(file_path)
    local buffer_number = -1
    if buffer_number == -1 then
      vim.api.nvim_command("botright vnew")
      buffer_number = vim.api.nvim_get_current_buf()

      vim.api.nvim_buf_set_name(buffer_number, types[2])
      vim.api.nvim_set_option_value("filetype", "typescript", { buf = buffer_number })
    end
    local lines = vim.split(types[1], "\n")
    vim.api.nvim_buf_set_lines(buffer_number, 0, -1, false, lines)
  else
    print("Error: Unable to open the file for writing")
    return "Error: Unable to open the file for writing"
  end
end

return M
