local utils = require("json-to-types.utils")

local M = {}
Error_message = "Error: Provide valid JSON"

M.types_output = function(file_name, target_language)
  local types_output_file = utils.executeTypesCommand(file_name, target_language)
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
      -- vim.notify("Types saved at " .. types_output_file)
      return types
    end
  else
    vim.notify("Error: Unable to open the output file")
  end
end

M.types_output_buffer = function(file_name, target_language)
  local types_output_file, filetype = utils.executeTypesCommand(file_name, target_language)
  local file = io.open(types_output_file, "r")
  if file then
    local types = file:read("*a")
    file:close()
    local escaped_error_message = string.gsub(Error_message, "%p", "%%%1")
    if string.find(types, escaped_error_message) then
      return { Error_message }
    else
      return { types, types_output_file, filetype }
    end
  else
    return { "Error: Unable to open the output file" }
  end
end
return M
