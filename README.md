<div align="center"><h1>hide-tab-bar.yazi</h1></div>

Yazi plugin that hides the tab bar and shows tabs in the header instead.

<!-- ![showcase](https://github.com/crawraps/hide-tab-bar.yazi/assets/VIDEO_OR_IMAGE_ID) -->

## Installation

```sh
ya pack -a crawraps/hide-tab-bar.yazi
```

Or manually:

```sh
git clone https://github.com/crawraps/hide-tab-bar.yazi ~/.config/yazi/plugins/hide-tab-bar.yazi
```

## Usage

Add to your `init.lua`:

```lua
require("hide-tab-bar"):setup { max_width = 20 }
```

No keymap configuration needed — the plugin modifies the UI layout automatically on setup.

## Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `max_width` | number | `20` | Maximum display width per tab label before truncation |

## Theming

This plugin fully respects all existing `th.tabs` theme options — `active`, `inactive`, `sep_inner`, and `sep_outer`. Configure them in your `theme.toml` or flavor as usual.

Example `theme.toml`:

```toml
[tabs]
active = { fg = "#000000", bg = "#ffffff" }
inactive = { fg = "#888888" }
sep_inner = { open = "", close = "" }
sep_outer = { open = "", close = "" }
```
