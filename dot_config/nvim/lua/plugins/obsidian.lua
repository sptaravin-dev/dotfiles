return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ft = "markdown",
  lazy = false,

  keys = {
    { "<leader>m", group = "Obsidian" },
    { "<leader>mt", ":Obsidian new_from_template<cr>", desc = "obsidian new from [t]emplate" },
    { "<leader>mn", ":Obsidian new<cr>", desc = "obsidian [n]ew" },
    { "<leader>mO", ":Obsidian open<cr>", desc = "obsidian [O]pen in app" },
  },

  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    ui = {
      enable = false,
    },
    workspaces = {
      {
        name = "second-brain",
        path = vim.fn.expand("~") .. "/second-brain",
      },
    },
    notes_subdir = "00-Inbox",
    new_notes_location = "notes_subdir",

    templates = {
      folder = "99-Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },

    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,

    -- NEW: merge template frontmatter tags into the generated frontmatter tags
    -- (keeps obsidian.nvim's id/aliases/tags behavior, just unions tags)
    frontmatter = {
      enabled = true,
      sort = { "id", "aliases", "tags" },
      func = function(note)
        local out = require("obsidian.builtin").frontmatter(note)

        local function to_list(x)
          if x == nil then
            return {}
          end
          if type(x) == "string" then
            return { x }
          end
          if type(x) == "table" then
            return x
          end
          return {}
        end

        local function uniq(list)
          local seen, res = {}, {}
          for _, t in ipairs(list) do
            if type(t) == "string" then
              t = t:gsub("^#", "") -- allow "#tag" too
              if t ~= "" and not seen[t] then
                seen[t] = true
                table.insert(res, t)
              end
            end
          end
          return res
        end

        local meta_tags = note.metadata and note.metadata.tags or nil
        out.tags = uniq(vim.list_extend(to_list(out.tags), to_list(meta_tags)))

        return out
      end,
    },
  },
}
