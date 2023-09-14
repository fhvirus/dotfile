local helpers = require('first-setup.plugin-config.LuaSnip.helper')
local get_visual = helpers.get_visual

-- Math context detection 
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

return {
  s({ trig = "hi" },
    { t("Hello, world!"), }
  ),
  s({trig="env", snippetType="autosnippet"},
    fmta([[
    \begin{<>}
      <>
    \end{<>}
    ]],
    {
      i(1),
      i(2),
      rep(1),  -- this node repeats insert node i(1)
    }
    )
  ),
}
