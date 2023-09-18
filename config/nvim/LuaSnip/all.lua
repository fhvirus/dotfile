local helpers = require('first-setup.plugin-config.LuaSnip.helper')
local get_visual = helpers.get_visual

-- Math context detection 
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

return {
  s({ trig = "hi" },
    { t("Hello, world!"), }
  )
}
