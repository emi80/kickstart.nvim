-- Hot patch nvim-lspconfig to add Nextflow language server
require('lspconfig.configs').nextflow_ls = {
  default_config = {
    cmd = { 'java', '-jar', vim.env.HOME .. '/bin/nextflow-language-server-all.jar' },
    filetypes = { 'nextflow' },
    root_dir = function(fname)
      local util = require 'lspconfig.util'
      return util.root_pattern 'nextflow.config'(fname) or util.find_git_ancestor(fname)
    end,
    settings = {
      nextflow = {
        files = {
          exclude = { '.git', '.nf-test', 'work' },
        },
      },
    },
  },
}

-- Set up the Nextflow language server like any other language server
-- (once the language server is added upstream, this will be the only code necessary)
require('lspconfig').nextflow_ls.setup {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  -- on_attach = function(client, bufnr) end, -- set up on attach function
}

vim.treesitter.language.register('groovy', 'nextflow')
