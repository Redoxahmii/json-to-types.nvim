local json_to_types = require("json-to-types")
-- BUG: debug the error being thrown
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
    return {
      "cjson",
      "c++",
      "cr",
      "cs",
      "dart",
      "elixir",
      "elm",
      "flow",
      "go",
      "haskell",
      "java",
      "js",
      "javascript-prop-types",
      "kotlin",
      "objc",
      "php",
      "pike",
      "py",
      "rs",
      "scala3",
      "Smithy",
      "swift",
      "typescript",
      "typescript-zod",
      "typescript-effect-schema",
      "javascript",
      "cpp",
      "csharp",
      "rust",
      "python",
      "ruby",
    }
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
    return {
      "cjson",
      "c++",
      "cr",
      "cs",
      "dart",
      "elixir",
      "elm",
      "flow",
      "go",
      "haskell",
      "java",
      "js",
      "javascript-prop-types",
      "kotlin",
      "objc",
      "php",
      "pike",
      "py",
      "rs",
      "scala3",
      "Smithy",
      "swift",
      "typescript",
      "typescript-zod",
      "typescript-effect-schema",
      "javascript",
      "cpp",
      "csharp",
      "rust",
      "python",
      "ruby",
    }
  end,
})
