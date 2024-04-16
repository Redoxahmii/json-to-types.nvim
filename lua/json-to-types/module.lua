local helper = require("json-to-types.helper")

---@class CustomModule
local M = {}

M.write_types = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local file_name = vim.api.nvim_buf_get_name(bufnr)
  local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
  local text = helper.buffer_to_string(filetype)
  if not text then
    return
  end
  local file_path = "./test.txt"
  local file = io.open(file_path, "w+")
  if file then
    file:write(text)
    file:close()
    helper.types_output(file_name)
    os.remove(file_path)
  else
    vim.notify("ERROR: Something went wrong")
  end
end

M.write_types_buffer = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local file_name = vim.api.nvim_buf_get_name(bufnr)
  local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
  local text = helper.buffer_to_string(filetype)
  if not text then
    return
  end
  local file_path = "./test.txt"
  local file = io.open(file_path, "w+")
  if file then
    file:write(text)
    file:close()
    local types = helper.types_output_buffer(file_name)
    if string.find(types[1], Error_message) then
      vim.notify(Error_message)
      os.remove(file_path)
    else
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
    end
  else
    vim.notify("Error: Unable to open the file for writing")
  end
end

return M
