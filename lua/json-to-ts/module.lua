---@class CustomModule
local M = {}

---@return string
M.greeting = function(greeting)
  print(greeting)
  return greeting
end

--- [NOTE: function that only runs on json and currently writes the output to hardcoded file path]
--  [TODO: Write a temp file which the node js library can pick up and read]

M.currentBuftext = function()
  local bufnr = vim.api.nvim_get_current_buf()
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
  vim.notify(text)
  local home = os.getenv("HOME")
  -- [NOTE:  file_path atm is hardcoded for where i have a file for testing if it writes the buffer.]
  -- Change it according to your needs
  local file_path = home .. "/Code/Neovim/test/file.txt"
  -- local temp_file_path = os.tmpname()
  local file = io.open(file_path, "w")

  if file then
    file:write(text)
    file:close()
    print("Text has been written to the file: " .. file_path)
  else
    print("Error: Unable to open the file for writing")
  end
end

return M
