local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

-- nmap <leader> <Plug>VimspectorContinue
-- nmap <leader> <Plug>VimspectorStop
-- nmap <leader> <Plug>VimpectorRestart
-- nmap <leader> <Plug>VimspectorPause
-- nmap <leader> <Plug>VimspectorBreakpoints
-- nmap <leader> <Plug>VimspectorToggleBreakpoint
-- nmap <leader> <Plug>VimspectorToggleConditionalBreakpoint
-- nmap <leader> <Plug>VimspectorAddFunctionBreakpoint
-- nmap <leader> <Plug>VimspectorGoToCurrentLine
-- nmap <leader> <Plug>VimspectorRunToCursor
-- nmap <leader> <Plug>VimspectorStepOver
-- nmap <leader> <Plug>VimspectorStepInto
-- nmap <leader> <Plug>VimspectorStepOut
-- nmap <leader> <Plug>VimspectorDisassemble
-- nmap <leader> <Plug>VimspectorUpFrame
-- nmap <leader> <Plug>VimspectorDownFrame
-- nmap <leader> <Plug>VimspectorJumpToNextBreakpoint
-- nmap <leader> <Plug>VimspectorJumpToPreviousBreakpoint
-- nmap <leader> <Plug>VimspectorJumpToProgramCounter
-- nmap <leader> <Plug>VimspectorBalloonEval
-- nmap <leader> <Plug>VimspectorWatch
-- nmap <leader> <Plug>VimspectorEval
-- nmap <Leader><F1> <Plug>:call vimspector#Reset()<CR>
-- nmap <Leader>di <Plug>VimspectorBalloonEval
-- xmap <Leader>di <Plug>VimspectorBalloonEval

local opts = { 
  prefix = "<leader>",
}

local mappings = {
  d = {
    name = "debug",
    c = { "<cmd>call vimspector#Continue()<cr>", " Start /  Continue" },
    s = { "<cmd>call vimspector#Stop()<cr>", " Stop" },
    r = { "<cmd>call vimspector#Restart()<cr>", " Restart" },
    q = { "<cmd>call vimspector#Reset()<cr>", "Quit" },
    p = { "<cmd>call vimspector#Pause()<cr>", " Pause" },

    -- breakpoints
    b = { "<cmd>call vimspector#ToggleBreakpoint()<cr>", " Toggle Breakpoint" },
    n = { "<cmd>call vimspector#JumpToNextBreakpoint()<cr>", "󰮺 Next Breakpoint" },
    N = { "<cmd>call vimspector#JumpToPrevBreakpoint()<cr>", "󰮹 Previous Breakpoint" },

    -- execution
    i = { "<cmd>call vimspector#StepInto()<cr>", " Step Into" },
    o = { "<cmd>call vimspector#StepOut()<cr>", " Step Out" },
    l = { "<cmd>call vimspector#StepOver()<cr>", " Step Over" },
    u = { "<cmd>call vimspector#UpFrame()<cr>", "󰮽 Up Frame" },
    d = { "<cmd>call vimspector#DownFrame()<cr>", "󰮷 Down Frame" },
    g = { "<cmd>call vimspector#GoToCurrentLine()<cr>", " Go To Current Line" },
    f = { "<cmd>call vimspector#RunToCursor()<cr>", " Run To Cursor" },

    -- eval
    x = { "<cmd>call vimspector#ShowDisassembly()<cr>", "Show Disassembly" },
    k = { "<Plug>VimspectorBalloonEval<cr>", "Balloon Eval" },
    w = { "<cmd>call vimspector#AddWatch()<cr>", "Watch" },
    e = { "<cmd>call vimspector#Evaluate()<cr>", "Evaluate" },

    -- f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    -- r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
    -- n = { "New File" }, -- just a label. don't create any mapping
    -- e = "Edit File", -- same as above
    -- ["1"] = "which_key_ignore",  -- special label to hide it in the popup
    -- b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
  },
}

wk.register(mappings, opts)
