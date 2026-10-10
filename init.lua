vim.schedule(function()
  require("options")
  require("keymaps")
end)

require("options_pre")
require("configs.lazy")
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- Уменьшаем задержку проверки (в миллисекундах).
    -- 0 = мгновенно, 150 = комфортно и без лагов на больших файлах.
    client.config.debounce_text_changes = 150
  end,
})
