local json_to_types = require("json-to-types")
local utils = require("json-to-types.utils")

vim.api.nvim_create_user_command("ConvertJSONtoLang", function(args)
  if args.args == "" then
    vim.notify("Please provide a language name", vim.log.levels.ERROR)
    return
  end
  if not json_to_types.convertTypes then
    vim.notify("convertTypes function not found", vim.log.levels.ERROR)
    return
  end
  json_to_types.convertTypes(args.args)
end, {
  nargs = 1,
  complete = function()
    return utils.language_map()
  end,
})

vim.api.nvim_create_user_command("ConvertJSONtoLangBuffer", function(args)
  if args.args == "" then
    vim.notify("Please provide a language name", vim.log.levels.ERROR)
    return
  end
  if not json_to_types.convertTypesBuffer then
    vim.notify("convertTypesBuffer function not found", vim.log.levels.ERROR)
    return
  end
  json_to_types.convertTypesBuffer(args.args)
end, {
  nargs = 1,
  complete = function()
    return utils.language_map()
  end,
})
