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
    },
  }
```

## 🚀 Usage

- Use the command `:ConvertJSONtoTS` to convert the JSON to TypeScript types.
- You can also make a keybinding for the command by referring to the method provide above.

## 👷 Features to come

- [ ] Create a read only buffer with the types.
- [ ] Add the ability to add the types to the current buffer.
