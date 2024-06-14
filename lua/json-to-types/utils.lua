---@class CustomModule
local M = {}

M.executeTypesCommand = function(file_name, target_language)
  local home = os.getenv("HOME")
  local base_name = vim.fn.fnamemodify(file_name, ":t:r")
  local types_output_file = "./" .. "Types-" .. base_name .. ".ts"
  -- Update the types_command to use quicktype.js with the target language
  local types_command = "node "
    .. home
    .. "/Code/Neovim/json-to-types.nvim/quicktype.js "
    .. target_language
    .. " "
    .. file_name
    .. " > "
    .. types_output_file
  -- local types_command = "node " .. home .. "/.local/share/nvim/lazy/json-to-types.nvim/quicktype.js " .. target_language .. " " .. file_name .. " > " .. types_output_file
  os.execute(types_command)
  return types_output_file
end

M.buffer_to_string = function(filetype)
  if filetype == "json" then
    local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
    return table.concat(content, "\n")
  else
    vim.notify("Error: Filetype is not JSON")
    return
  end
end
return M
