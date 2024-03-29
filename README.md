<div align=center>
  <h1>✏️ weaver.nvim</h1>
</div>

<img src="./assets/screenshot.png" alt="screenshot" />

Simple note taking app for neovim that can be attached to buffers, or can be made global.

## Latest release

**v1.0.0**
Add support for destroying weaver either global or the one attached to active buffer.

`:DestroyWeaver`: Destroy *weaver* that is currently attached to active buffer, or pass `g` to destroy global weaver.

## About

This is a simple note taking plugin that creates temporary buffers that can be attached to separate buffers or create a single global buffer. Initially, I designed the plugin for myself, but I will be spending some time to update and modify it for others, refer [TODO](#todo) section for more.

## Install

Rquirements:
 - neovim >= 0.7.0
 - [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) (you can add it as a dependency while installing)


Using [packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use {
  "genzyy/weaver.nvim",
  requires = {"nvim-lua/plenary.nvim"},
  config = true,
}
```

Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
return {
    "genzyy/weaver.nvim",
    dependencies = {
   "nvim-lua/plenary.nvim"
    },
    config = function()
        require("weaver").setup()
    end,
}
```

Using [LazyVim](https://github.com/LazyVim/LazyVim)
```lua
return {
  "genzyy/weaver.nvim",
  dependencies = {
   "nvim-lua/plenary.nvim"
  },
  config = true,
}
```

## Usage and commands

- `:Weaver`: Open a weaver attached to current buffer. This will remember the contents as long as the session is maintained and cannot be used in any other buffer.

- `:CloseWeaver`: Close weaver that is attached to current buffer.

- `:Weaver g`: Same as first command but with "g" passed as argument. This will create a global weaver that is not attached to any current nvim buffers and can be opened with any buffer in the session.

- `:CloseWeaver g`: Close global weaver.

- `:ToggleWeaver`: A toggle command to open/close weaver. Pass `g` as argument to toggle global weaver.

- `:DestroyWeaver`: Destroy *weaver* that is currently attached to active buffer, or pass `g` to destroy global weaver.


## ToDo

- [ ] Make UI better (maybe custom popup?)
- [ ] Better code quality
- [ ] Formatting and highlighting for weaver contents (markdown support?)
