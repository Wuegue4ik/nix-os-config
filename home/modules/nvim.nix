{ pkgs, ... }:
{

  programs.nixvim = {
    enable = true;
       
    globals = {
      mapleader = " ";
    };
    
    opts = {
      number = true;
      relativenumber = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      smartindent = true;
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;
      swapfile = false;
      backup = false;
      undodir = "/tmp";
      clipboard = "unnamedplus";
    };
    
    keymaps = [
      {
        key = "<leader>t";
        action = ":NvimTreeToggle<CR>";
        options = {
          desc = "Toggle file tree";
          silent = true;
        };
      }
      {
        key = "<leader>e";
        action = ":NvimTreeFocus<CR>";
        options = {
          desc = "Focus file tree";
          silent = true;
        };
      }
      {
        key = "<leader>w";
        action = ":w<CR>";
        options = {
          desc = "Save file";
          silent = true;
        };
      }
      {
        key = "<leader>q";
        action = ":q<CR>";
        options = {
          desc = "Quit";
          silent = true;
        };
      }
      {
        key = "<leader>wq";
        action = ":wq<CR>";
        options = {
          desc = "Write & Quit";
          silent = true;
        };
      }
    ];
    
    plugins = {
      web-devicons.enable = true;

      luasnip.enable = true;

      lsp = {
        enable = true;
        servers = {
          pyright.enable = true;

          ts_ls.enable = true;
          eslint.enable = true;

          nil_ls.enable = true;
        };
      };

      lspkind = {
        enable = true;
        settings.mode = "symbol_text";
      };

      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "buffer"; }
            { name = "path"; }
          ];
          mapping = {
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<Tab>" = "cmp.mapping.confirm({ select = true })";
            "<C-Space>" = "cmp.mapping.complete()";
          };
        };
      };

      nvim-tree = {
        enable = true;
        settings = {
          auto_reload_on_write = true;
          disable_netrw = true;
          hijack_netrw = true;
          view = {
            width = 30;
            side = "left";
          };
          actions = {
            open_file = {
              quit_on_open = false;
              resize_window = true;
            };
          };
          filters = {
            dotfiles = false;
          };
          update_focused_file = {
            enable = true;
            update_root = true;
          };
          update_cwd = true;
          git = {
            enable = true;
            ignore = false;
          };
        };
      };
      
      nvim-autopairs = {
        enable = true;
        settings = {
          checkTs = true;
          disableFiletype = ["TelescopePrompt" "vim"];
        };
      };
      
      bufferline = {
        enable = true;
        settings.options = {
          mode = "buffers";
          numbers = "none";
          closeCommand = "bdelete! %d";
          rightMouseCommand = "bdelete! %d";
          diagnostics = "nvim_lsp";
          alwaysShowBufferline = true;
          theme = "auto";
        };
      };

      treesitter = {
        enable = true;
        settings = {
          highlight = {
            enable = true;
          };
          indent = {
            enable = true;
          };
        };
      };
    };
  };

}
