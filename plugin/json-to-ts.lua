vim.api.nvim_create_user_command("ConvertJSONtoTS", require("json-to-ts").convertTypes, {})

-- INFO: This autocmd creates a keymap for the json filetype.
