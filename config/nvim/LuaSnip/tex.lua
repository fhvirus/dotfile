-- Mostly from https://github.com/ejmastnak/dotfiles/
local helpers = require('first-setup.plugin-config.LuaSnip.helper')
local get_visual = helpers.get_visual

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
  a = "alpha"   , b  = "beta"       , g = "gamma" , G = "Gamma"   , d  = "delta"   , D  = "Delta"    ,
  e = "epsilon" , ve = "varepsilon" , z = "zeta"  , h = "eta"     , q  = "theta"   , vq = "vartheta" ,
  Q = "Theta"   , k  = "kappa"      , i = "iota"  , l = "lambda"  , L  = "Lambda"  , m  = "mu"       ,
  n = "nu"      , x  = "xi"         , X = "Xi"    , p = "pi"      , P  = "Pi"      , r  = "rho"      ,
  s = "sigma"   , S  = "Sigma"      , t = "tau"   , f = "phi"     , vf = "varphi"  , F  = "Phi"      ,
  o = "omega"   , O  = "Omega"      , c = "chi"   , y = "upsilon" , Y  = "Upsilon" , v  = "psi"      , V = "Psi"
};

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
        \caption{<>}
        \label{fig:<>}
      \end{figure}]],
      { i(1, "htbp"), i(2), i(3, "caption"), i(4, "label"), i(5) }
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
        \item <>
      \end{align*}]],
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
  s({trig = "([^%l])mm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
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
  s({trig = "([^%l])dm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
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
  s({trig = "([^%a]);([%a])", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta("<>\\<>",
      {
        f( function(_, snip) return snip.captures[1] end ),
        f( function(_, snip) return Greek[snip.captures[2]] end )
      }
    )
  )
}
