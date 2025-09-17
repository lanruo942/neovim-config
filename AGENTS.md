# Repository Guidelines

## Project Structure & Module Organization
- Entry point: `init.lua`.
- Core modules in `lua/summer/`:
  - Settings: `options.lua`, `colorscheme.lua`, `keymaps.lua`.
  - Plugins: `plugins.lua` (declare/boot Packer), configs in `plugin-config/*.lua`.
  - LSP and tools: `lsp/*`, completion in `cmp.lua`, DAP in `dap/*`.
- Generated file: `plugin/packer_compiled.lua` (do not edit; rebuilt by Packer).

## Build, Test, and Development Commands
- Start Neovim with this config: `nvim` (when repo is `~/.config/nvim`).
- Isolated run: `NVIM_APPNAME=nvim nvim` or `nvim --clean -u ~/.config/nvim/init.lua`.
- Plugin ops: `:PackerSync` (install/update), `:PackerCompile` (rebuild loader).
- Treesitter: `:TSUpdate` to fetch parsers.
- Health checks: `:checkhealth`, LSP registry: `:Mason`.

## Coding Style & Naming Conventions
- Language: Lua, 2-space indent, no tabs.
- Prefer `local` scope and table-return modules.
- Module names: `summer.<area>` (e.g., `summer.plugin-config.telescope`).
- New plugin configs live in `lua/summer/plugin-config/<name>.lua` and are `require`d from `init.lua` or `plugins.lua` as appropriate.

## Testing Guidelines
- Quick validation: `nvim --headless "+luafile init.lua" +q` (syntax/load errors fail).
- Runtime smoke test: launch `nvim`, open `:messages`, and exercise keymaps in `lua/summer/keymaps.lua`.
- Keep changes incremental; verify `:checkhealth`, `:PackerCompile`, and LSP startup.

## Commit & Pull Request Guidelines
- Use Conventional Commits: `feat(lsp): add inlay hints`, `fix(telescope): correct path preview`, `chore: bump plugin pins`.
- PRs should include: brief description, affected files/areas, before/after notes or screenshots (if UI), and steps to verify (commands).
- Do not commit secrets or local paths; avoid editing `plugin/packer_compiled.lua` directly.

## Agent-Specific Notes
- Modify plugin list in `lua/summer/plugins.lua`; add config files under `plugin-config/` and wire them in `init.lua`.
- Keep edits minimal and scoped; do not rename public module paths.
