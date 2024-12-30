return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      grep = {
        rg_glob = true,
        rg_glob_fn = function(query)
          local regex, flags = query:match("^(.-)%s%-%-(.*)$")
          return (regex or query), flags
        end,
      },
    },
  },
}
