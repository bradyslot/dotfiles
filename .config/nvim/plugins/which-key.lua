local wk = require("which-key")

wk.add({
  { "<leader>d", group = "debug" },

  -- controls
  name = "Controls",
  { "<leader>dc", "<cmd>call vimspector#Continue()<cr>",             desc = " Start /  Continue" },
  { "<leader>dp", "<cmd>call vimspector#Pause()<cr>",                desc = " Pause" },
  { "<leader>dq", "<cmd>call vimspector#Reset()<cr>",                desc = " Quit" },
  { "<leader>dr", "<cmd>call vimspector#Restart()<cr>",              desc = " Restart" },
  { "<leader>ds", "<cmd>call vimspector#Stop()<cr>",                 desc = " Stop" },

  -- breakpoints
  name = "Breakpoints",
  { "<leader>dN", "<cmd>call vimspector#JumpToPrevBreakpoint()<cr>", desc = "󰮹 Previous Breakpoint" },
  { "<leader>db", "<cmd>call vimspector#ToggleBreakpoint()<cr>",     desc = " Toggle Breakpoint" },
  { "<leader>dn", "<cmd>call vimspector#JumpToNextBreakpoint()<cr>", desc = "󰮺 Next Breakpoint" },

  -- execution
  name = "Execution",
  { "<leader>dd", "<cmd>call vimspector#DownFrame()<cr>",            desc = "󰮷 Down Frame" },
  { "<leader>df", "<cmd>call vimspector#RunToCursor()<cr>",          desc = " Run To Cursor" },
  { "<leader>dg", "<cmd>call vimspector#GoToCurrentLine()<cr>",      desc = " Go To Current Line" },
  { "<leader>di", "<cmd>call vimspector#StepInto()<cr>",             desc = " Step Into" },
  { "<leader>dl", "<cmd>call vimspector#StepOver()<cr>",             desc = " Step Over" },
  { "<leader>do", "<cmd>call vimspector#StepOut()<cr>",              desc = " Step Out" },
  { "<leader>du", "<cmd>call vimspector#UpFrame()<cr>",              desc = "󰮽 Up Frame" },

  -- eval
  name = "Eval",
  { "<leader>de", "<cmd>call vimspector#Evaluate()<cr>",             desc = " Eval" },
  { "<leader>dk", "<cmd>call vimspector#ShowBalloonEval<cr>",        desc = "󰔣 Balloon Eval" },
  { "<leader>dw", "<cmd>call vimspector#AddWatch()<cr>",             desc = "󰈈 Watch" },
  { "<leader>dx", "<cmd>call vimspector#ShowDisassembly()<cr>",      desc = " Disassembly" },
})
