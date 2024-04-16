local M = {}

--- [INFO: Change paths on prod]
-- PROD LINK
-- local types_command = "node"
--   .. " "
--   .. home
--   .. "/.local/share/nvim/lazy/json-to-types.nvim/index.js > "
--   .. types_output_file
--LOCAL LINK
-- local types_command = "node"
--     .. " "
--     .. home
--     .. "/Code/Neovim/json-to-types.nvim/index.js > "
--     .. types_output_file

Error_message = "Provide valid JSON"

M.types_output = function(file_name)
  local home = os.getenv("HOME")
  local base_name = vim.fn.fnamemodify(file_name, ":t:r")
  local types_output_file = "./" .. "Types-" .. base_name .. ".ts"
  local types_command = "node"
    .. " "
    .. home
    .. "/.local/share/nvim/lazy/json-to-types.nvim/index.js > "
    .. types_output_file
  os.execute(types_command)

  local file = io.open(types_output_file, "r")
  if file then
    local types = file:read("*a")
    file:close()
    local escaped_error_message = string.gsub(Error_message, "%p", "%%%1")
    if string.find(types, escaped_error_message) then
      vim.notify(Error_message)
      return
    else
      vim.api.nvim_command("edit " .. types_output_file)
      vim.notify("Types saved at " .. types_output_file)
      return types
    end
  else
    vim.notify("Error: Unable to open the output file")
  end
end

M.types_output_buffer = function(file_name)
  local home = os.getenv("HOME")
  local base_name = vim.fn.fnamemodify(file_name, ":t:r")
  local types_output_file = "./" .. "Types-" .. base_name .. ".ts"
  local types_command = "node"
    .. " "
    .. home
    .. "/.local/share/nvim/lazy/json-to-types.nvim/index.js > "
    .. types_output_file
  os.execute(types_command)
  local file = io.open(types_output_file, "r")
  if file then
    local types = file:read("*a")
    file:close()
    os.remove(types_output_file)
    local escaped_error_message = string.gsub(Error_message, "%p", "%%%1")
    if string.find(types, escaped_error_message) then
      return { Error_message, types_output_file }
    else
      return { types, types_output_file }
    end
  else
    vim.notify("Error: Unable to open the output file")
  end
end

M.buffer_to_string = function(filetype)
  if filetype == "json" then
    local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
    return table.concat(content, "\n")
  else
    vim.notify("File is not json")
    return
  end
end

return M
