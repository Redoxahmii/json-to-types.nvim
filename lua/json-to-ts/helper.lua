local M = {}

--- [INFO: Change paths on prod]

-- local types_command = "node"
--     .. " "
--     .. home
--     .. "/Code/Neovim/json-to-ts.nvim/index.js > "
--     .. types_output_file

M.types_output = function(file_name)
  local home = os.getenv("HOME")
  local base_name = vim.fn.fnamemodify(file_name, ":t:r")
  local types_output_file = "./" .. "Types" .. base_name .. ".ts"

  local types_command = "node"
    .. " "
    .. home
    .. "/.local/share/nvim/lazy/json-to-ts.nvim/index.js > "
    .. types_output_file
  os.execute(types_command)
  local file = io.open(types_output_file, "r")
  if file then
    local types = file:read("*a")
    file:close()
    vim.api.nvim_command("edit " .. types_output_file)
    vim.notify("Types saved at " .. types_output_file)
    return types
  else
    print("Error: Unable to open the output file")
  end
end

M.types_output_buffer = function(file_name)
  local home = os.getenv("HOME")
  local base_name = vim.fn.fnamemodify(file_name, ":t:r")
  local types_output_file = "./" .. "Types" .. base_name .. ".ts"
  local types_command = "node"
    .. " "
    .. home
    .. "/.local/share/nvim/lazy/json-to-ts.nvim/index.js > "
    .. types_output_file
  os.execute(types_command)
  local file = io.open(types_output_file, "r")
  if file then
    local types = file:read("*a")
    file:close()
    os.remove(types_output_file)
    return { types, types_output_file }
  else
    print("Error: Unable to open the output file")
  end
end

return M
