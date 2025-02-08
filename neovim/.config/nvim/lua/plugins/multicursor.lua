return {
  "jake-stewart/multicursor.nvim",
  event = "VeryLazy",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()
    local set = vim.keymap.set
    -- 使用 Control + 左键单击添加和删除光标。
    set("n", "<c-leftmouse>", mc.handleMouse)
    -- 使用主光标添加和删除光标的简单方法。
    set({ "n", "v" }, "<leader>m", mc.toggleCursor, { desc = "tag 多光标" })
    -- 通过正则表达式匹配视觉选择中的新光标。
    set("v", "<leader>m", mc.matchCursors)
    -- 启用/禁用多光标。
    set("n", "<leader>M", function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      elseif mc.hasCursors() then
        mc.clearCursors()
      else
        -- Default <esc> handler.
      end
    end, { desc = "(启动/取消)多光标" })
  end,
}
