vim.api.nvim_create_user_command("ConvertJSONtoTS", require("json-to-ts").convertTypes, {})
vim.api.nvim_create_user_command("ConvertJSONtoTSBuffer", require("json-to-ts").convertTypesBuffer, {})

-- INFO: This autocmd creates a keymap for the json filetype.
