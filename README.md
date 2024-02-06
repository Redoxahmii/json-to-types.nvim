# 🚬 json-to-ts.nvim

A plugin for lazy people who don't want to write typescript types by hand. This plugin will convert JSON to TypeScript types.

## 📋 Requirements

- Neovim >= **0.8.0** (needs to be built with **LuaJIT**)

## 📦 Installation

Install the plugin with your preferred package manager:

[lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "Redoxahmii/json-to-ts.nvim",
    keys = {
      {
        "<leader>cu",
        "<CMD>ConvertJSONtoTS<CR>",
        desc = "Convert JSON to TS",
      },
    {
        "<leader>ct",
        "<CMD>ConvertJSONtoTSBuffer<CR>",
        desc = "Convert JSON to TS in buffer",
      }
    },
  }
```

## 🚀 Usage

- Reason for appending `Types` before the file name is to avoid overwriting if there is an already `.ts` file in the same directory with the same name.
- Use the command `:ConvertJSONtoTS` to convert the JSON to TypeScript types and save the file immediately.
- Use this command `:ConvertJSONtoTSBuffer` to convert the JSON to TypeScript types and open them in a split buffer to check first before saving the file.
- You can also make keybindings for the mentioned commands by referring to the method provided above.

## 👷 Features to come

- [x] Create a read only buffer with the types.
- [ ] Add the ability to add the types to the current buffer.
