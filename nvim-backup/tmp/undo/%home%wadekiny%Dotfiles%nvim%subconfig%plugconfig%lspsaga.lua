Vim�UnDo� ��_�*�~�L�٬nlqZ�i��%9W���R   z                  	       	   	   	    c���    _�                             ����                                                                                                                                                                                                                                                                                                                                                             c��     �         a      #require('lspsaga').init_lsp_saga({ 5��                                                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c��     �         a    �         a    5��                          '               &       5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c��     �         b      %--require('lspsaga').init_lsp_saga({ 5��                          '                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c��     �         b      $-require('lspsaga').init_lsp_saga({ 5��                          '                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c��    �         b      #require('lspsaga').init_lsp_saga({ 5��                        :                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c���     �       	   b       5��                                                  �                                                �                                                �                                                �                                                �                                                �                                                �                                                5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                             c���     �         i    �         i    5��                                         �      5�_�                 	           ����                                                                                                                                                                                                                                                                                                                            z                      V        c���    �              b   -- 旧版本配置   %--require('lspsaga').init_lsp_saga({    require('lspsaga').setup({        --border_style = "double",   D--the range of 0 for fully opaque window (disabled) to 100 for fully   H--transparent background. Values between 0-30 are typically most useful.   --saga_winblend = 70,   symbol_in_winbar = {       in_custom = true,       --enable = true,       separator = '  ',       --show_file = true,   5    ---- define how to customize filename, eg: %:., %   ,    ---- if not set, use default value `%:t`   9    ---- more information see `vim.fn.expand` or `expand`   1    ----  only valid after set `show_file = true`       --file_formatter = "%:p",       --click_support = false,           },       })                       *local function get_file_name(include_path)   E    local file_name = require('lspsaga.symbolwinbar').get_file_name()   2    if vim.fn.bufname '%' == '' then return '' end   6    if include_path == false then return file_name end   =    -- Else if include path: ./lsp/saga.lua -> lsp > saga.lua   H    local sep = vim.loop.os_uname().sysname == 'Windows' and '\\' or '/'   V    --local path_list = vim.split(string.gsub(vim.fn.expand '%:~:.:h', '%%', ''), sep)   R    local path_list = vim.split(string.gsub(vim.fn.expand '%:p:h', '%%', ''), sep)       local file_path = ''       local cnt=0   &    for _, cur in ipairs(path_list) do           if cnt == 0           then   <            file_path = (cur == '.' or cur == '~') and '' or   Q                    file_path .. cur .. '' .. '%#LspSagaWinbarSep#▊%*' .. ' %*'           else   <            file_path = (cur == '.' or cur == '~') and '' or   P                    file_path .. cur .. ' ' .. '%#LspSagaWinbarSep#>%*' .. ' %*'           end           cnt = cnt + 1       end   \    file_name = string.gsub(file_name,"DevIcon.-#","LspSagaDevIcon#")--为了改背景颜色   !    return file_path .. file_name       end       ,local function config_winbar_or_statusline()       local exclude = {           ['terminal'] = true,           ['toggleterm'] = true,           ['prompt'] = true,           ['NvimTree'] = true,           ['help'] = true,           --['dap-repl'] = true,   2    } -- Ignore float windows and exclude filetype   M    if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then           vim.wo.winbar = ''       else   B        local ok, lspsaga = pcall(require, 'lspsaga.symbolwinbar')           local sym   6        if ok then sym = lspsaga.get_symbol_node() end           local win_val = ''   D        win_val = get_file_name(true) -- set to true to include path   7        if sym ~= nil then win_val = win_val .. sym end   n        win_val = string.gsub(win_val,"LspSaga.-#","LspSagaWinBar#")--为了改背景颜色,替换颜色分组           --vim.notify(win_val)           vim.wo.winbar = win_val            -- if work in statusline           -- vim.wo.stl = win_val       end   end       ;local events = { 'BufEnter', 'BufWinEnter', 'CursorMoved' }       %vim.api.nvim_create_autocmd(events, {       pattern = '*',   <    callback = function() config_winbar_or_statusline() end,   })       %vim.api.nvim_create_autocmd('User', {   $    pattern = 'LspsagaUpdateSymbol',   <    callback = function() config_winbar_or_statusline() end,   })       +vim.cmd("highlight WinBar guibg='#112255'")   2vim.cmd("highlight LspSagaWinBar guibg='#112255'")       ---vim.cmd("highlight WinBar guibg='#07090c'")   4--vim.cmd("highlight LspSagaWinBar guibg='#07090c'")5��           b       b       �      �      �      5�_�              	      z        ����                                                                                                                                                                                                                                                                                                                                       z           V        c���     �      {       `   -- require('lspsaga').setup({    --   -- --border_style = "double",   G-- --the range of 0 for fully opaque window (disabled) to 100 for fully   K-- --transparent background. Values between 0-30 are typically most useful.   -- --saga_winblend = 70,   -- symbol_in_winbar = {   --     in_custom = true,   --     --enable = true,   --     separator = '  ',   --     --show_file = true,   8--     ---- define how to customize filename, eg: %:., %   /--     ---- if not set, use default value `%:t`   <--     ---- more information see `vim.fn.expand` or `expand`   4--     ----  only valid after set `show_file = true`    --     --file_formatter = "%:p",   --     --click_support = false,   --   --   -- },   --   -- })   --   --   --   --   --   --- local function get_file_name(include_path)   H--     local file_name = require('lspsaga.symbolwinbar').get_file_name()   5--     if vim.fn.bufname '%' == '' then return '' end   9--     if include_path == false then return file_name end   @--     -- Else if include path: ./lsp/saga.lua -> lsp > saga.lua   K--     local sep = vim.loop.os_uname().sysname == 'Windows' and '\\' or '/'   Y--     --local path_list = vim.split(string.gsub(vim.fn.expand '%:~:.:h', '%%', ''), sep)   U--     local path_list = vim.split(string.gsub(vim.fn.expand '%:p:h', '%%', ''), sep)   --     local file_path = ''   --     local cnt=0   )--     for _, cur in ipairs(path_list) do   --         if cnt == 0   --         then   ?--             file_path = (cur == '.' or cur == '~') and '' or   T--                     file_path .. cur .. '' .. '%#LspSagaWinbarSep#▊%*' .. ' %*'   --         else   ?--             file_path = (cur == '.' or cur == '~') and '' or   S--                     file_path .. cur .. ' ' .. '%#LspSagaWinbarSep#>%*' .. ' %*'   --         end   --         cnt = cnt + 1   
--     end   _--     file_name = string.gsub(file_name,"DevIcon.-#","LspSagaDevIcon#")--为了改背景颜色   $--     return file_path .. file_name   --   -- end   --   /-- local function config_winbar_or_statusline()   --     local exclude = {   --         ['terminal'] = true,   !--         ['toggleterm'] = true,   --         ['prompt'] = true,   --         ['NvimTree'] = true,   --         ['help'] = true,   !--         --['dap-repl'] = true,   5--     } -- Ignore float windows and exclude filetype   P--     if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then   --         vim.wo.winbar = ''   --     else   E--         local ok, lspsaga = pcall(require, 'lspsaga.symbolwinbar')   --         local sym   9--         if ok then sym = lspsaga.get_symbol_node() end   --         local win_val = ''   G--         win_val = get_file_name(true) -- set to true to include path   :--         if sym ~= nil then win_val = win_val .. sym end   q--         win_val = string.gsub(win_val,"LspSaga.-#","LspSagaWinBar#")--为了改背景颜色,替换颜色分组    --         --vim.notify(win_val)   "--         vim.wo.winbar = win_val   #--         -- if work in statusline   "--         -- vim.wo.stl = win_val   
--     end   -- end   --   >-- local events = { 'BufEnter', 'BufWinEnter', 'CursorMoved' }   --   (-- vim.api.nvim_create_autocmd(events, {   --     pattern = '*',   ?--     callback = function() config_winbar_or_statusline() end,   -- })   --   (-- vim.api.nvim_create_autocmd('User', {   '--     pattern = 'LspsagaUpdateSymbol',   ?--     callback = function() config_winbar_or_statusline() end,   -- })   --   .-- vim.cmd("highlight WinBar guibg='#112255'")   5-- vim.cmd("highlight LspSagaWinBar guibg='#112255'")   --   0-- --vim.cmd("highlight WinBar guibg='#07090c'")   7-- --vim.cmd("highlight LspSagaWinBar guibg='#07090c'")5��           `       `       &      t      �      5��