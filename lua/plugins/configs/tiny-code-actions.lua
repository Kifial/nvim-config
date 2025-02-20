require("tiny-code-action").setup({
  telescope_opts = {
    layout_strategy = "vertical",
    layout_config = {
      width = 0.7,
      height = 0.5,
      preview_cutoff = 1,
      preview_height = function(_, _, max_lines)
        local h = math.floor(max_lines * 0.5)
        return math.max(h, 10)
      end,
    },
  },
})
