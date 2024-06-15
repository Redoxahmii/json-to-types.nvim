vim.api.nvim_create_user_command("ConvertJSONtoTS", require("json-to-types").convertTypes("javascript"), {})
vim.api.nvim_create_user_command("ConvertJSONtoTSBuffer", require("json-to-types").convertTypesBuffer, {})

-- INFO: This autocmd creates a keymap for the json filetype.
