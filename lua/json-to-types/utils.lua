---@class CustomModule
local M = {}

local filetype_map = {
  cjson = { extension = "c", filetype = "c" },
  ["c++"] = { extension = "cpp", filetype = "cpp" },
  cr = { extension = "cr", filetype = "crystal" },
  cs = { extension = "cs", filetype = "cs" },
  dart = { extension = "dart", filetype = "dart" },
  elixir = { extension = "ex", filetype = "elixir" },
  elm = { extension = "elm", filetype = "elm" },
  flow = { extension = "js", filetype = "javascript" },
  go = { extension = "go", filetype = "go" },
  haskell = { extension = "hs", filetype = "haskell" },
  java = { extension = "java", filetype = "java" },
  ["javascript-prop-types"] = { extension = "js", filetype = "javascript" },
  kotlin = { extension = "kt", filetype = "kotlin" },
  objc = { extension = "m", filetype = "objc" },
  php = { extension = "php", filetype = "php" },
  pike = { extension = "pike", filetype = "pike" },
  py = { extension = "py", filetype = "python" },
  rs = { extension = "rs", filetype = "rust" },
  scala3 = { extension = "scala", filetype = "scala" },
  Smithy = { extension = "smithy", filetype = "smithy" },
  swift = { extension = "swift", filetype = "swift" },
  typescript = { extension = "ts", filetype = "typescript" },
  ["typescript-zod"] = { extension = "ts", filetype = "typescript" },
  ["typescript-effect-schema"] = { extension = "ts", filetype = "typescript" },
  javascript = { extension = "js", filetype = "javascript" },
  cpp = { extension = "cpp", filetype = "cpp" },
  csharp = { extension = "cs", filetype = "cs" },
  rust = { extension = "rs", filetype = "rust" },
  python = { extension = "py", filetype = "python" },
  ruby = { extension = "rb", filetype = "ruby" },
}

local function get_file_info(language)
  return filetype_map[language] or { extension = "txt", filetype = "text" }
end

M.executeTypesCommand = function(file_name, target_language)
  local home = os.getenv("HOME")
  local base_name = vim.fn.fnamemodify(file_name, ":t:r")
  local file_info = get_file_info(target_language)
  local types_output_file = "./" .. "Types-" .. base_name .. "." .. file_info.extension
  -- local types_command = "node "
  --   .. home
  --   .. "/Code/Neovim/json-to-types.nvim/quicktype.js "
  --   .. target_language
  --   .. " "
  --   .. file_name
  --   .. " > "
  --   .. types_output_file
  local types_command = "node --no-warnings "
    .. vim.fn.stdpath('data') .. "/lazy/json-to-types.nvim/quicktype.js "
    .. target_language
    .. " "
    .. file_name
    .. " > "
    .. types_output_file
  os.execute(types_command)
  return types_output_file, file_info.filetype
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
