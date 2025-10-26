-- Mostly from https://github.com/ejmastnak/dotfiles/

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

function get_visual(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ''))
  end
end

return {
  s({trig = "fhw", dscr = "Homework template."},
    fmta([[
      #import "@local/fhwt:0.2.0": *
      #show: doc =>> conf(
        Author: "<>",
        AuthorID: "<>",
        CourseName: "<>",
        Title: "<>",
        doc)

      <>]],
      { i(1), i(2), i(3), i(4), i(0) }
    )
  ),
}
