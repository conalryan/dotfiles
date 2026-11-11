# Neovim Configuration

This is a modular Neovim setup for day-to-day development, code review, and debugging. The entry point is `init.lua`; plugin specifications live in `lua/plugins/` and core settings and keymaps live in `lua/config/`.

## Requirements

- Neovim 0.12 or newer
- Git
- `ripgrep` for Telescope's live grep
- A C compiler and `make` for Telescope's native fuzzy finder
- `tree-sitter-cli`, `tar`, and `curl` for Treesitter parser installation
- Language tools installed in each project or through Mason: TypeScript/Angular, Python, Rust, HTML/CSS, Markdown, and Bash language servers
- Formatters and linters installed in the project or on `PATH`: Prettier, Oxfmt, Oxlint, Ruff, rustfmt, StyLua, shfmt, and ShellCheck as needed
- Debug adapters installed with Mason and project runtimes as needed; see the [debugging guide](nvim-config-guide.md#debugging)

On macOS, install Neovim and common system tools with Homebrew:

```sh
brew install neovim git ripgrep make tree-sitter-cli
```

## First Run

Start Neovim with `nvim`. The configuration bootstraps `lazy.nvim`; Lazy then installs the declared plugins. Mason installs the configured language servers. Use `:Mason` to inspect servers and `:Lazy` to inspect plugins.

Copilot requires a GitHub Copilot subscription and authentication. Run `:Copilot auth` and follow its instructions.

## Common Keys

The leader key is Space. `which-key` shows available leader mappings.

| Key | Action |
| --- | --- |
| `<leader>e` | Focus the left Neo-tree pane; Enter toggles folders or opens files on the right |
| `<leader>ff` / `<leader>fg` | Find files / search file contents |
| `gd` / `gr` / `K` | Go to definition / find references / hover docs |
| `<leader>rn` / `<leader>ca` | Rename symbol / code action |
| `<leader>f` | Format buffer |
| `<leader>gg` | Open Fugitive Git status |
| `<leader>tt` | Toggle terminal below content, to the right of the explorer |
| `<leader>xx` | Toggle diagnostics list |
| `<leader>Db` / `<leader>Dc` | Toggle breakpoint / start or continue debugging |
| `<C-y>` in insert mode | Accept Copilot suggestion |
| `<leader>ac` in normal or visual mode | Toggle Copilot Chat in a right-hand split |

In Neo-tree, Space also expands or collapses folders, `-` navigates to the parent directory, `H` toggles hidden files, and `?` shows explorer commands.
The filesystem explorer follows the current file and displays folders without indentation guide lines.

Copilot Chat opens in insert mode. Type a prompt and press `<C-s>` to submit, or press Escape and then Enter. Press Escape before using `<leader>ac` to close it. Use `:CopilotChatModels` to select an available chat model. Add `#buffer:active` or `#selection` to include code context. The separate `:Copilot panel` is a read-only completion preview, not chat.

For repository-wide chat, run `:cd /path/to/repository` in the editor before opening chat; `:pwd` shows the working directory. Chat has buffer, file, filename search, text search, and Git diff tools available by default, with approval required for tool calls. Ask it to discover and read relevant files; the entire repository is not automatically included in every prompt. Search normally respects ignore rules and skips hidden files. File reads are not sandboxed to the repository, so review requested paths before approving. To leave a staged-diff conversation, use `:CopilotChatReset` and remove any staged-diff-only prompt or sticky resource.

Formatting runs on save when a configured formatter is available. For JavaScript and related filetypes, Prettier is preferred and Oxfmt is the fallback. Oxlint diagnostics run when Oxlint is available in the project. ESLint diagnostics and fixes are provided by its language server.

Use `:checkhealth` when diagnosing missing executables or environment setup.
