local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- define table of snippets
local snippets = {
  s("cp", {
    t({
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "template <typename T> using vec = vector<T>;",
      "template <typename T, typename U> using p = pair<T, U>;",
      "#define printv(v)         \\",
      "  for (const auto &e : v) \\",
      '  cout << e << " ";       \\',
      '  cout << "\\n"',
      "#define readv(v)         \\",
      "  for (auto &e : v)      \\",
      "  cin >> e",
      "#define all(v) v.begin(), v.end()",
      "#define rall(v) v.rbegin(), v.rend()",
      "using ll = long long;",
      "using ld = long double;",
      "using ull = unsigned long long;",
      "",
      "char el = '\\n';",
      "",
      "void open(string s) {",
      '  freopen((s + ".in").c_str(), "r", stdin);',
      '  freopen((s + ".out").c_str(), "w", stdout);',
      "}",
      "",
      "int main() {",
      "  ",
    }),
    i(0),
    t({ "", "}" }),
  }),
}

return snippets -- <--- MUST return the table of snippets
