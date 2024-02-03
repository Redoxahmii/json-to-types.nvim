vim.api.nvim_create_user_command("ConvertJSONtoTS", require("json-to-ts").convertTypes, {})

-- INFO: This autocmd creates a keymap for the json filetype.

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.keymap.set("n", "<Leader>cu", function()
      require("json-to-ts").convertTypes()
    end, { desc = "print current text in buffer" })
  end,
})
