-- INFO: This is a user command created you can go to command mode and type "MyFirstFunction" and it will print Hello passed in the local config.
vim.api.nvim_create_user_command("MyFirstFunction", require("json-to-ts").hello, {})

-- INFO: This autocmd crreates a keymap for the json filetype.
-- ISSUE: The key map does not go away once you open a json file.

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.keymap.set("n", "<Leader>cu", function()
      require("json-to-ts").AutoBuf()
    end, { desc = "print current text in buffer" })
  end,
})
