local opt = vim.opt

opt.tabstop=4
opt.shiftwidth=4
opt.autoindent=true
opt.smartindent=true
opt.number=true
opt.relativenumber=true
opt.smarttab=true
opt.softtabstop=4


-- Use system clipboard / WSL fix
if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'clip.exe',
            ['*'] = 'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end
vim.opt.clipboard = 'unnamedplus'
