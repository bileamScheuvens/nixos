local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node


return {
  s("def", {
    t("#definition(title: \""),
    i(1, "title"),
    t({"\")[", "", "]"}),
  }),
  s("thm", {
    t("#theorem(title: \""),
    i(1, "title"),
    t({"\")[", "", "]"}),
  }),
  s("alg", {
    t("#algorithm(title: \""),
    i(1, "title"),
    t({"\")[", "", "]"}),
  })
}

