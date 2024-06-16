# 🚬 json-to-types.nvim

A plugin for lazy people who don't want to write types by hand. This plugin will convert JSON to various types based on the selected language.

## 📋 Requirements

- Neovim >= **0.8.0** (needs to be built with **LuaJIT**)

## Updates

### Major Update:

Added support for multiple languages. The list of supported languages is as follows:

- [x] TypeScript
- [x] JavaScript
- [x] Python
- [x] C#
- [x] Go
- [x] Rust
- [x] PHP
- [x] Ruby
- [x] Swift
- [x] Kotlin
- [x] C++
- [x] CJSON
- [x] Crystal (cr)
- [x] Dart
- [x] Elixir
- [x] Elm
- [x] Flow
- [x] Haskell
- [x] Java
- [x] JavaScript Prop Types
- [x] Objective-C
- [x] Pike
- [x] Scala3
- [x] Smithy
- [x] TypeScript Zod
- [x] TypeScript Effect Schema

### Breaking Changes:

- The commands `ConvertJSONtoTS` and `ConvertJSONtoTSBuffer` have been renamed to `ConvertJSONtoLang` and `ConvertJSONtoLangBuffer` respectively. Please update your keybindings and scripts accordingly.

## 📦 Installation

Install the plugin with your preferred package manager:

[lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
"Redoxahmii/json-to-types.nvim",
build = "sh install.sh npm",
keys = {
{
"<leader>cu",
"<CMD>ConvertJSONtoLang typescript<CR>",
desc = "Convert JSON to TS",
},
{
"<leader>ct",
"<CMD>ConvertJSONtoLangBuffer typescript<CR>",
desc = "Convert JSON to TS in buffer",
},
},
}
```

- Provide your installer in the build command. Instead of `npm`, you can pass whatever you are using such as `yarn`.

## 🚀 Usage

### 🆕 New

- To create keymaps for the language you want, you can refer to the method provided above or use it directly in command mode as well:

```
:ConvertJSONtoLang typescript
:ConvertJSONtoLang javascript
:ConvertJSONtoLang python
:ConvertJSONtoLang csharp
:ConvertJSONtoLang go
:ConvertJSONtoLang rust
:ConvertJSONtoLang php
:ConvertJSONtoLang ruby
:ConvertJSONtoLang swift
:ConvertJSONtoLang kotlin
:ConvertJSONtoLang cpp
:ConvertJSONtoLang cjson
:ConvertJSONtoLang cr
:ConvertJSONtoLang dart
:ConvertJSONtoLang elixir
:ConvertJSONtoLang elm
:ConvertJSONtoLang flow
:ConvertJSONtoLang haskell
:ConvertJSONtoLang java
:ConvertJSONtoLang javascript-prop-types
:ConvertJSONtoLang objc
:ConvertJSONtoLang pike
:ConvertJSONtoLang scala3
:ConvertJSONtoLang Smithy
:ConvertJSONtoLang typescript-zod
:ConvertJSONtoLang typescript-effect-schema
```

- This will create a new file with the name `types-{filename}.{extension}` in the same directory as the file you are editing with type definitions.
- Similarly, you can use the `ConvertJSONtoLangBuffer` command to create a new buffer with type definitions so you can make your changes immediately.
- Supported languages are listed above for your reference.
- The reason for appending `Types-` before the file name is to avoid overwriting if there is an already existing `.{extension}` file in the same directory with the same name.
- The base command has been renamed to `ConvertJSONtoLang` and the buffer command has been renamed to `ConvertJSONtoLangBuffer`.
- You can also make keybindings for the mentioned commands by referring to the method provided above.

## 👷 Features to Come

- [x] Create a read-only buffer with the types.
- [x] Support for other languages.
- [ ] Allow user to paste their API Link and get the types automatically.
