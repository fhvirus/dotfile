-- Mostly from https://github.com/ejmastnak/dotfiles/
local helpers = require('first-setup.plugin-config.LuaSnip.helper')
local get_visual = helpers.get_visual
local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Math context detection 
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end
tex.in_comment = function() return vim.fn['vimtex#syntax#in_comment']() == 1 end

tex.in_env = function(name)
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
tex.in_equation = function() return tex.in_env('equation') end
tex.in_itemize = function() return tex.in_env('itemize') end
tex.in_tikz = function() return tex.in_env('tikzpicture') end
tex.in_algo = function() return tex.in_env('algorithmic') end

local Greek = {
  a = "alpha"   , b = "beta"    , g = "gamma"  , G = "Gamma" , d = "delta" , D = "Delta" ,
  e = "epsilon" , z = "zeta"    , h = "eta"    , q = "theta" , Q = "Theta" , k = "kappa" ,
  i = "iota"    , l = "lambda"  , L = "Lambda" , m = "mu"    , n = "nu"    , x = "xi"    ,
  X = "Xi"      , p = "pi"      , P = "Pi"     , r = "rho"   , s = "sigma" , S = "Sigma" ,
  t = "tau"     , f = "phi"     , F = "Phi"    , o = "omega" , O = "Omega" , c = "chi"   ,
  y = "upsilon" , Y = "Upsilon" , w = "psi"    , W = "Psi"
};
local VarGreek = { ve = "varepsilon" , vt  = "vartheta" , vf = "varphi" };

return {
  -- DOCUMENT TEMPLATE
  s({trig = "fhw", dscr = "Homework template."},
    fmta([[
      \documentclass{fhw}

      \author{<>}
      \title{<>}
      \ID{<>}
      \CourseID{<>}
      \CourseName{<>}
      \<>Print

      \begin{document} \maketitle

      <>

      \end{document}]],
      { i(1), i(2), i(3), i(4), i(5), i(6, "No"), i(0) }
    )
  ),
  -- ENVIRONMENTS
  s({ trig = "env", dscr = "Basic environment." },
    fmta([[
      \begin{<>}
        <>
      \end{<>}]],
      { i(1), i(2), rep(1) }
    ),
    { condition = line_begin }
  ),
  -- TABLE
  s({ trig = "table", dscr = "Table environment" },
    fmta([[
      \begin{table}[<>]
        \centering
        \caption{<>}
        \label{tab:<>}
        \begin{tabular}{<>}
          <>
        \end{tabular}
      \end{table}]],
      { i(1, "htbp"), i(2, "caption"), i(3, "label"), i(4, "c"), i(5) }
    ),
    { condition = line_begin }
  ),
  -- FIGURE
  s({ trig = "fig", dscr = "Figure environment" },
    fmta([[
      \begin{figure}[<>]
        \centering
        \includegraphics[width=<>\linewidth]{<>}
      \end{figure}]],
      { i(1, "htbp"), i(2), i(3) }
    ),
    { condition = line_begin }
  ),
  -- ENUMERATE
  s({ trig = "enn", dscr = "Enumerate", snippetType="autosnippet" },
    fmta([[
      \begin{enumerate}<>
        \item <>
      \end{enumerate}]],
      { i(1), i(2) }
    ),
    { condition = line_begin }
  ),
  -- ITEMIZE
  s({ trig = "itt", dscr = "Itemize", snippetType="autosnippet" },
    fmta([[
      \begin{itemize}
        \item <>
      \end{itemize}]],
      { i(1) }
    ),
    { condition = line_begin }
  ),
  -- ALIGN
  s({ trig = "all", dscr = "Align", snippetType="autosnippet" },
    fmta([[
      \begin{align*}
        <>
      \end{align*}]],
      { i(1) }
    ),
    { condition = line_begin }
  ),
  -- CASES
  s({ trig = "case", dscr = "Cases", snippetType="autosnippet" },
    fmta([[
      \begin{cases}
        <>
      \end{cases}]],
      { i(1) }
    ),
    { condition = line_begin }
  ),
  -- MINTED
  s({ trig = "mint", dscr = "Minted", snippetType="autosnippet" },
    fmta([[
      \begin{minted}{<>}
      <>
      \end{minted}]],
      { i(1, "text"), i(2) }
    ),
    { condition = line_begin }
  ),
  -- INLINE MINTED
  s({ trig = "inline", dscr = "Inline Minted" },
    fmta([[\mintinline{<>}{<>}]],
      { i(1, "text"), i(2) }
    )
  ),
  -- PSUEDOCODE
  s({ trig = "sdc", dscr = "Psuedocode" },
    fmta([[
      \begin{algorithm}
      \caption{<>}\label{<>}
        \begin{algorithmic}
        <>
        \end{algorithmic}
      \end{algorithm}]],
      { i(1), i(2), i(3) }
    ),
    { condition = line_begin }
  ),
  -- INLINE MATH
  s({trig = "([^%l%a])mm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta([[ <>\( <> \) ]],
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- INLINE MATH ON NEW LINE
  s({trig = "^mm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta([[ \( <> \) ]],
      { i(1), }
    )
  ),
  -- DISPLAY MATH
  s({trig = "([^%l%a])dm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta([[ <>\[ <> \] ]],
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- DISPLAY MATH ON NEW LINE
  s({trig = "^dm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta([[ \[ <> \] ]],
      { i(1), }
    )
  ),
  -- Brackets
  s({trig = "lr(", snippetType="autosnippet"},
    fmta([[ \left( <> \right) ]], { i(1), })),
  s({trig = "lr[", snippetType="autosnippet"},
    fmta([[ \left[ <> \right] ]], { i(1), })),
  s({trig = "lr{", snippetType="autosnippet"},
    fmta([[ \left\{ <> \right\} ]], { i(1), })),
  s({trig = "lr|", snippetType="autosnippet"},
    fmta([[ \left| <> \right| ]], { i(1), })),
  s({trig = "lr<", snippetType="autosnippet"},
    fmt([[ \left< {} \right> ]], { i(1), })),
  -- TYPEWRITER i.e. \texttt
  s({trig = "([^%a])tt", regTrig = true, wordTrig = false, snippetType="autosnippet", priority=2000},
    fmta("<>\\texttt{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_text}
  ),
  -- ITALIC i.e. \textit
  s({trig = "([^%a])tii", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta("<>\\textit{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- BOLD i.e. \textbf
  s({trig = "tbb", snippetType="autosnippet"},
    fmta("\\textbf{<>}",
      { d(1, get_visual), })),
  -- MATH ROMAN i.e. \mathrm
  s({trig = "([^%a])rmm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta("<>\\mathrm{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- MATH CALIGRAPHY i.e. \mathcal
  s({trig = "([^%a])mcc", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta("<>\\mathcal{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- MATH BOLDFACE i.e. \mathbf
  s({trig = "([^%a])mbf", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta("<>\\mathbf{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- MATH BLACKBOARD i.e. \mathbb
  s({trig = "([^%a])mbb", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta("<>\\mathbb{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- REGULAR TEXT i.e. \text (in math environments)
  s({trig = "([^%a])tee", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta("<>\\text{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),
  -- GREEK ALPHABETS
  s({trig = "([^%a]);([a-uw-zA-Z])", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta("<>\\<>",
      {
        f( function(_, snip) return snip.captures[1] end ),
        f( function(_, snip) return Greek[snip.captures[2]] end )
      }
    )
  ),
  s({trig = "([^%a]);(v[%a])", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta("<>\\<>",
      {
        f( function(_, snip) return snip.captures[1] end ),
        f( function(_, snip) return VarGreek[snip.captures[2]] end )
      }
    )
  ),
  -- SUPERSCRIPT
  s({trig = "([%w%)%]%}])^", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SUBSCRIPT
  s({trig = "([%w%)%]%}])_", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- TEXT SUBSCRIPT
  s({trig = 'sd', snippetType="autosnippet", wordTrig=false},
    fmta("_{\\mathrm{<>}}",
      { d(1, get_visual) }
    ),
    {condition = tex.in_mathzone}
  ),
  -- FRACTION
  s({trig = "([^%a%\\])//", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\frac{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- ABSOLUTE VALUE
  s({trig = "([^%a%\\])aa", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\abs{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- FLOOR
  s({trig = "([^%a%\\])fl", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\floor{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- CEILING
  s({trig = "([^%a%\\])ce", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\ceil{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- INNER PRODUCT
  s({trig = "([^%a%\\])inn", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\inner{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- NORM
  s({trig = "([^%a%\\])nn", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\norm{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SET
  s({trig = "([^%a%\\])set", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\set{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SQUARE ROOT
  s({trig = "([^%\\])sq", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\sqrt{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- BINOMIAL SYMBOL
  s({trig = "([^%\\])bnn", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\binom{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- VECTOR, i.e. \overightarrow
  s({trig = "([^%a])vv", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\vvec{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- VECTOR, i.e. \mathbf
  s({trig = "([^%a])bv", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\bvec{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- TRANSPOSE
  s({trig = "([%w%)%]%}])T", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta( "<>^{T}", { f( function(_, snip) return snip.captures[1] end ), }),
    {condition = tex.in_mathzone}
  ),
  -- SUM with lower limit
  s({trig = "([^%a])ssm", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\sum\\limits_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SUM with upper and lower limit
  s({trig = "([^%a])smm", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\sum\\limits_{<>}^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- MIN
  s({trig = "([^%a])mnn", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\min\\limits_{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2)
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- MAX
  s({trig = "([^%a])mxx", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\max\\limits_{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2)
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- ARROWS
  s({trig = "->", snippetType="autosnippet"},
    t("\\to"), {condition = tex.in_mathzone}),
  s({trig = "=>", snippetType="autosnippet"},
    t("\\implies"), {condition = tex.in_mathzone}),
  s({trig = "<-", snippetType="autosnippet"},
    t("\\gets"), {condition = tex.in_mathzone}),
  s({trig = "<=", snippetType="autosnippet"},
    t("\\impliedby"), {condition = tex.in_mathzone}),
  s({trig = "iff", snippetType="autosnippet",},
    t("\\iff"), {condition = tex.in_mathzone}),
  s({trig = "><", snippetType="autosnippet"},
    t("\\contra"), {condition = tex.in_mathzone}),
  -- URL 
  s({trig="url"},
    fmta( [[\url{<>}]],
      { d(1, get_visual), })),
  -- HREF 
  s({trig="href"},
    fmta(
      [[\href{<>}{<>}]],
      {
        i(1, "url"),
        i(2, "display name")
      }
    )
  ),
  -- SECTION
  s({trig="h1", snippetType="autosnippet"},
    fmta( [[\section{<>}]], { d(1, get_visual), }),
    { condition = line_begin }
  ),
  -- SUBSECTION
  s({trig="h2", snippetType="autosnippet"},
    fmta( [[\subsection{<>}]], { d(1, get_visual), }),
    { condition = line_begin }
  ),
  -- SUBSUBSECTION
  s({trig="h3", snippetType="autosnippet"},
    fmta( [[\subsubsection{<>}]], { d(1, get_visual), }),
    { condition = line_begin }
  ),
  -- SECTION*
  s({trig="H1", snippetType="autosnippet"},
    fmta( [[\section*{<>}]], { d(1, get_visual), }),
    { condition = line_begin }
  ),
  -- SUBSECTION*
  s({trig="H2", snippetType="autosnippet"},
    fmta( [[\subsection*{<>}]], { d(1, get_visual), }),
    { condition = line_begin }
  ),
  -- SUBSUBSECTION
  s({trig="H3", snippetType="autosnippet"},
    fmta( [[\subsubsection*{<>}]], { d(1, get_visual), }),
    { condition = line_begin }
  ),
  -- ML hypothesis
  s({trig = "([^%a])hyp", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\mathcal{H}",
      { f( function(_, snip) return snip.captures[1] end ) }
    ),
    {condition = tex.in_mathzone}
  )
}
