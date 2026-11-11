# Neovim Configuration Guide

This document explains how this Neovim setup is organized and how to use it for development, code review, and debugging. It is intended as a practical companion to the configuration rather than a Neovim tutorial.

## Requirements

- Neovim 0.12 or newer
- Git
- `ripgrep` for Telescope's content search
- `make` and a C compiler for Telescope's native fuzzy finder
- `tree-sitter-cli`, `tar`, `curl`, and a C compiler for Treesitter parsers
- Project language servers, formatters, and linters, or the relevant Mason-managed language servers

On macOS, install the common system dependencies with Homebrew:

```sh
brew install neovim git ripgrep make tree-sitter-cli
xcode-select --install
```

The second command installs Apple's command-line tools, including a C compiler. Check `nvim --version` if startup reports an unsupported Neovim version.

## First Run

Launch Neovim from a terminal:

```sh
nvim
```

On its first run, `lua/config/lazy.lua` clones [lazy.nvim](https://github.com/folke/lazy.nvim) into Neovim's data directory. Lazy installs the declared plugins, and the Treesitter module requests the configured parsers. Mason installs the listed language servers. These downloads need network access; allow the initial launch to finish before using language features.

Copilot is optional. It requires an eligible GitHub Copilot account. Run `:Copilot auth` and complete the authentication flow in the browser.

## Configuration Layout

```text
init.lua                  Entry point and leader keys
lua/config/options.lua    Editor defaults and filetype-specific indentation
lua/config/keymaps.lua    General mappings
lua/config/lazy.lua       lazy.nvim bootstrap and plugin loader settings
lua/plugins/              Plugin specifications, grouped by responsibility
```

The entry point sets Space as the leader and comma as the local leader, then loads editor settings, keymaps, and the plugin manager. Plugin specs are grouped into LSP, completion, formatting, editing/navigation, UI, Git, Copilot, and terminal modules. This keeps changes localized and makes each plugin's setup easy to find.

## Package Managers

There are two separate managers:

- **lazy.nvim** manages Neovim plugins. Use `:Lazy` to view installed plugins, install updates, or inspect plugin activity. Plugin specifications are under `lua/plugins/`.
- **Mason** manages language-server executables. Use `:Mason` to view or install servers. The configured servers are installed automatically when the LSP plugin initializes.

Mason can also install debug adapters; see [Debugging](#debugging). It does not install every formatter or linter used here. Install those tools in the project or on your `PATH`, following each tool's own instructions. Local project installs are often preferable because they keep editor behavior aligned with the project's package versions.

## Default Settings

The defaults in `lua/config/options.lua` are chosen for programming and multi-file work:

| Setting | Behavior |
| --- | --- |
| Line numbers | Absolute numbers are shown |
| Mouse | Enabled |
| Clipboard | Uses the system clipboard (`unnamedplus`) |
| Indentation | Spaces, 4 columns by default; 2 columns for JavaScript, TypeScript, HTML, CSS/SCSS, JSON, and YAML |
| Search | Case-insensitive unless the query contains an uppercase character |
| Undo | Persistent undo history is enabled |
| Signs | Sign column is always visible to avoid layout shifts |
| Splits | New vertical and horizontal splits open to the right and below |
| Scrolling | Six lines/columns of context are kept around the cursor |
| UI | True color and cursor-line highlighting are enabled |
| Responsiveness | `updatetime` is 250 ms and mapping timeout is 400 ms |

Use `:set option?` to inspect a setting, for example `:set shiftwidth?`. Filetype-specific indentation is applied when a matching buffer is opened.

## Plugins

| Area | Plugins | Purpose |
| --- | --- | --- |
| LSP and servers | `nvim-lspconfig`, Mason, `mason-lspconfig.nvim` | Language-server configuration and server installation |
| Completion | `nvim-cmp`, LuaSnip, `cmp-nvim-lsp`, `cmp-buffer`, `cmp-path`, `cmp_luasnip`, friendly-snippets | LSP, snippet, path, and buffer completion |
| Syntax | `nvim-treesitter` | Parser installation and Neovim's built-in Treesitter highlighting |
| Formatting and linting | `conform.nvim`, `nvim-lint` | Format-on-save/manual formatting and external diagnostics |
| Files and search | Neo-tree, Telescope, Telescope fzf-native | Tree browsing, file finding, and content search |
| Git | Gitsigns, vim-fugitive | Inline change hunks and Git commands/status |
| AI completion | `copilot.lua` | Optional inline GitHub Copilot suggestions |
| Terminal | `toggleterm.nvim` | Floating terminal inside Neovim |
| Debugging | `nvim-dap`, `nvim-dap-ui`, `nvim-nio` | Debug adapter sessions, breakpoints, stepping, and inspection |
| Editing | Comment.nvim, nvim-autopairs | Commenting and automatic bracket pairing |
| UI | Gruvbox, lualine, which-key, Trouble, todo-comments | Colorscheme, statusline, mapping discovery, diagnostics, and TODO search |
| Icons | `nvim-web-devicons` | File and status icons where supported |

Lazy.nvim loads some plugins only when needed, such as completion upon entering insert mode or Fugitive when a Git command is called. This reduces startup work without changing how the features are invoked.

## Language Support

Mason is configured to install these servers:

| Languages / files | Language server |
| --- | --- |
| TypeScript, JavaScript, React/TSX | `ts_ls` |
| Angular | `angularls` |
| Python | `pyright` |
| Rust | `rust_analyzer` |
| HTML | `html` |
| CSS and SCSS | `cssls` |
| Markdown | `marksman` |
| Bash | `bashls` |
| JavaScript/TypeScript linting | `eslint` |

When a server attaches to a buffer, the configuration adds navigation and signature-help mappings. TypeScript server preferences enable module-export completions and prefer non-relative import paths, supporting auto-import suggestions when the language server can resolve the project.

Common LSP actions:

| Key | Action |
| --- | --- |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Find references |
| `K` | Show hover documentation |
| `<C-k>` in insert mode | Show signature help |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Show code actions |

`<leader>` means Space. LSP mappings are installed only after a server attaches to the current buffer.

## Formatting and Linting

Formatting is provided by Conform. It runs on save when a configured formatter is available; `<leader>f` formats the current buffer manually. The formatters selected by filetype are:

| Filetypes | Formatter(s), in configured order |
| --- | --- |
| JavaScript, TypeScript, React/TSX, HTML, CSS/SCSS, JSON, Markdown | Prettier, then Oxfmt |
| Lua | StyLua |
| Python | Ruff format |
| Rust | rustfmt |
| Bash and shell scripts | shfmt |

For JavaScript-family files, the configured list stops after the first available formatter. Install and configure the formatter in the project to get its expected formatting rules. LSP formatting is used as a fallback where applicable.

Diagnostics are provided by the ESLint language server for JavaScript/TypeScript and by Oxlint through `nvim-lint`. ShellCheck is configured for Bash and shell buffers. Linters run after saving and when leaving insert mode. ESLint code actions can be requested with `<leader>ca` when offered by the server.

Useful commands:

- `:ConformInfo` shows formatter availability for the current buffer.
- `:Mason` shows the language-server installation state.
- `:lua vim.diagnostic.open_float()` opens diagnostics at the cursor.
- `[d` and `]d` move between diagnostics.
- `<leader>xx` opens or closes the Trouble diagnostics view.

## Debugging

The debugger uses nvim-dap and its UI with Mason-installed adapters: `js-debug-adapter` for TypeScript/JavaScript, `debugpy` for Python, and `codelldb` for Rust. After updating the configuration, run `:Lazy install`, then install the adapters with:

```vim
:MasonInstall js-debug-adapter debugpy codelldb
```

Wait for installation to finish and check `:Mason` for errors. Node.js is required by the JavaScript adapter; Python and Rust projects also need their usual runtimes and tools. Start Neovim in the project root, or use `:cd /path/to/project`; `${workspaceFolder}` in the configurations means Neovim's current working directory.

Open a source file, set a breakpoint, and start a session. The debug UI opens when a session initializes; it shows scopes, breakpoints, call stacks, watches, a REPL, and a console. Select a stack frame or expand a variable with Enter. The UI closes when the session ends and can be toggled manually.

| Key | Action |
| --- | --- |
| `<leader>Db` | Toggle breakpoint on the current line |
| `<leader>Dc` | Start a session or continue execution |
| `<leader>Di` / `<leader>Do` / `<leader>DO` | Step into / over / out |
| `<leader>De` | Evaluate the word under the cursor or the visual selection |
| `<leader>Du` | Toggle the debug UI |
| `<leader>Dt` | Terminate the session |

These mappings use uppercase `D`; lowercase `<leader>d` continues to show diagnostics. `:DapShowLog` opens the debugger log.

### TypeScript and JavaScript

- **Launch TypeScript file with tsx** runs the current TypeScript or TSX file with Node and `--import tsx`. Install `tsx` as a project dependency (for example, `npm install --save-dev tsx`) and use a Node version supported by `tsx`.
- **Launch JavaScript file** runs the current JavaScript or JSX file with Node; JSX or other code requiring transformation needs a project-specific launch configuration instead.
- **Attach to Node on port 9229** attaches to a local process started with the Node inspector, for example `node --inspect-brk --import tsx src/index.ts`. The `--inspect-brk` flag waits at startup so early breakpoints can be set; continue after attaching.
- **Launch Chrome** prompts for the URL of an already running development server, then launches Chrome. The project root is used as `webRoot`. Configure the server or bundler to emit source maps for breakpoints in original TypeScript/TSX; compiled Node projects likewise need source maps, such as `"sourceMap": true` in `tsconfig.json`.

### Python

**Launch Python file** runs the current file using the active `VIRTUAL_ENV`, otherwise the project-root `.venv`, otherwise `python3` on `PATH`. Activate the project's environment before starting Neovim when it lives elsewhere. The adapter runs separately from the project interpreter, so install application dependencies in the selected project environment.

### Rust

Run `cargo build` in the project first, then select **Launch Rust executable** and enter the built executable's path, typically `target/debug/<binary-name>`. Build with debug information; Cargo's default dev profile includes it. For tests, `cargo test --no-run` builds test executables; select the relevant executable under `target/debug/deps/`. Use a project-specific configuration for arguments or a nonstandard target directory.

### Project-specific configurations

For applications needing arguments, environment variables, a test runner, or a different entry point, add a `.vscode/launch.json` in the project root. nvim-dap reads its supported configurations when starting a session; use adapter types `pwa-node`, `pwa-chrome`, `debugpy`, or `codelldb` and standard JSON without trailing commas. VS Code extension-specific features and adapter types are not automatically available. See `:help dap-launch.json` and the [adapter installation guide](https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation).

## Everyday Mappings

| Key | Action |
| --- | --- |
| `<Esc>` | Clear search highlighting |
| `<leader>w` / `<leader>q` | Save / close the current window |
| `<leader>e` | Focus the left Neo-tree file explorer |
| `<leader>ff` | Find files with Telescope |
| `<leader>fg` | Search file contents with Telescope live grep |
| `<leader>fb` | Find an open buffer |
| `<leader>fh` | Search Neovim help tags |
| `<leader>f` | Format the current buffer |
| `<leader>gg` | Open Fugitive Git status |
| `]h` / `[h` | Move to the next / previous Git hunk |
| `<leader>hs` | Stage the current Git hunk |
| `<leader>hr` | Reset the current Git hunk |
| `<leader>hp` | Preview the current Git hunk |
| `<leader>tt` | Toggle the floating terminal |
| `<C-y>` in insert mode | Accept a Copilot suggestion |
| `<M-]>` / `<M-[>` | Show the next / previous Copilot suggestion |
| `<C-]>` in insert mode | Dismiss a Copilot suggestion |

The which-key plugin displays available leader mappings. In Neo-tree, Enter expands or collapses a folder in place, or opens a file in the content pane on the right. Space also toggles folders, `-` navigates to the parent directory, `H` toggles hidden files, and `?` shows explorer commands.

## Troubleshooting

- **Plugin bootstrap fails:** Confirm Git and network access, then rerun `nvim`. Inspect `:Lazy` after startup.
- **A language server is missing:** Open `:Mason` and confirm its server is installed. Also confirm the filetype is detected correctly with `:set filetype?`.
- **No completion or navigation:** Confirm a server is attached to the buffer and check `:Mason` for installation errors. LSP mappings only appear after attachment.
- **Formatting does not run:** Use `:ConformInfo` and verify the corresponding formatter is installed and available in the project or `PATH`.
- **No lint diagnostics:** Confirm the relevant linter is installed and the project has its expected configuration. Oxlint and ShellCheck run only for their configured filetypes.
- **Debugging fails or a breakpoint is not hit:** Check `:Mason` for the required adapter, `:DapShowLog` for adapter errors, and `:pwd` for the project root. For TypeScript, check source maps and the `tsx` dependency; for Rust, rebuild with debug information and select the correct executable.
- **Treesitter parser errors:** Confirm `tree-sitter-cli`, `tar`, `curl`, and a C compiler are available. Parser installation is asynchronous on first startup; `:TSUpdate` updates parser versions.
- **Treesitter build fails with `ENOENT` for `tree-sitter`:** The CLI is missing from Neovim's `PATH`. On macOS, run `brew install tree-sitter-cli`; the `tree-sitter` Homebrew formula only provides the library, not the executable. Restart Neovim and check `:echo executable('tree-sitter')` returns `1`, then retry with `:TSInstall javascript typescript tsx`.
- **Telescope live grep returns an error:** Install `ripgrep` and verify `rg --version` works in the environment where Neovim runs.
- **General health checks:** Run `:checkhealth` and review the reported missing dependencies.

## References

- [Neovim documentation](https://neovim.io/doc/)
- [Neovim LSP documentation](https://neovim.io/doc/user/lsp.html)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [Mason.nvim](https://github.com/mason-org/mason.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Conform.nvim](https://github.com/stevearc/conform.nvim)
- [nvim-lint](https://github.com/mfussenegger/nvim-lint)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [Neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [GitHub Copilot for Neovim](https://github.com/zbirenbaum/copilot.lua)
