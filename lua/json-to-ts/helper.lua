local M = {}

--- [TODO: Change paths on prod]

M.types_output = function(file_name)
  local home = os.getenv("HOME")
  vim.notify(file_name)
  local base_name = vim.fn.fnamemodify(file_name, ":t:r")
  local types_output_file = "./" .. base_name .. ".ts"

  --- [TODO: change this path when prod]

  local types_command = "node"
    .. " "
    .. home
    .. "/.local/share/nvim/lazy/json-to-ts.nvim/index.js > "
    .. types_output_file
  os.execute(types_command)
  local file = io.open(types_output_file, "r")
  if file then
    file:read("*a")
    file:close()
    vim.api.nvim_command("edit " .. types_output_file)
  else
    print("Error: Unable to open the output file")
  end
end

return M
