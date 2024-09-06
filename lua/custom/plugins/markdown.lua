return ({
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
        vim.keymap.set('n', '<C-s>', '<Cmd>MarkdownPreviewToggle<CR>')

}),
  require('render-markdown').setup {
    checkbox = {
      enabled = true,
      position = 'inline',
      unchecked = {
        icon = '󰄱 ',
        highlight = 'RenderMarkdownUnchecked',
      },
      checked = {
        icon = '󰱒 ',
        highlight = 'RenderMarkdownChecked',
      },
      custom = {
        todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
      },
    },
    bullet = {
      -- Turn on / off list bullet rendering
      enabled = true,
      -- Replaces '-'|'+'|'*' of 'list_item'
      -- How deeply nested the list is determines the 'level'
      -- The 'level' is used to index into the array using a cycle
      -- If the item is a 'checkbox' a conceal is used to hide the bullet instead
      icons = { '●', '○', '◆', '◇' },
      -- Padding to add to the left of bullet point
      left_pad = 0,
      -- Padding to add to the right of bullet point
      right_pad = 0,
      -- Highlight for the bullet icon
      highlight = 'RenderMarkdownBullet',
    },
    dash = {
      -- Turn on / off thematic break rendering
      enabled = true,
      -- Replaces '---'|'***'|'___'|'* * *' of 'thematic_break'
      -- The icon gets repeated across the window's width
      icon = '─',
      -- Width of the generated line:
      --  <integer>: a hard coded width value
      --  full:      full width of the window
      width = 'full',
      -- Highlight for the whole line generated from the icon
      highlight = 'RenderMarkdownDash',
    },

    code = {
      -- Turn on / off code block & inline code rendering
      enabled = true,
      -- Turn on / off any sign column related rendering
      sign = true,
      -- Determines how code blocks & inline code are rendered:
      --  none:     disables all rendering
      --  normal:   adds highlight group to code blocks & inline code, adds padding to code blocks
      --  language: adds language icon to sign column if enabled and icon + name above code blocks
      --  full:     normal + language
      style = 'full',
      -- Determines where language icon is rendered:
      --  right: right side of code block
      --  left:  left side of code block
      position = 'left',
      -- Amount of padding to add around the language
      language_pad = 0,
      -- An array of language names for which background highlighting will be disabled
      -- Likely because that language has background highlights itself
      disable_background = { 'diff' },
      -- Width of the code block background:
      --  block: width of the code block
      --  full:  full width of the window
      width = 'full',
      -- Amount of padding to add to the left of code blocks
      left_pad = 0,
      -- Amount of padding to add to the right of code blocks when width is 'block'
      right_pad = 0,
      -- Minimum width to use for code blocks when width is 'block'
      min_width = 0,
      -- Determins how the top / bottom of code block are rendered:
      --  thick: use the same highlight as the code body
      --  thin:  when lines are empty overlay the above & below icons
      border = 'thin',
      -- Used above code blocks for thin border
      above = '▄',
      -- Used below code blocks for thin border
      below = '▀',
      -- Highlight for code blocks
      highlight = 'RenderMarkdownCode',
      -- Highlight for inline code
      highlight_inline = 'RenderMarkdownCodeInline',
    },
    heading = {
      -- Turn on / off heading icon & background rendering
      enabled = true,
      -- Turn on / off any sign column related rendering
      sign = true,
      -- Determines how icons fill the available space:
      --  inline:  underlying '#'s are concealed resulting in a left aligned icon
      --  overlay: result is left padded with spaces to hide any additional '#'
      position = 'overlay',
      -- Replaces '#+' of 'atx_h._marker'
      -- The number of '#' in the heading determines the 'level'
      -- The 'level' is used to index into the array using a cycle
      icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
      -- Added to the sign column if enabled
      -- The 'level' is used to index into the array using a cycle
      signs = { '󰫎 ' },
      -- Width of the heading background:
      --  block: width of the heading text
      --  full:  full width of the window
      -- Can also be an array of the above values in which case the 'level' is used
      -- to index into the array using a clamp
      width = 'full',
      -- Amount of padding to add to the left of headings
      left_pad = 0,
      -- Amount of padding to add to the right of headings when width is 'block'
      right_pad = 0,
      -- Minimum width to use for headings when width is 'block'
      min_width = 0,
      -- Determins if a border is added above and below headings
      border = false,
      -- Highlight the start of the border using the foreground highlight
      border_prefix = false,
      -- Used above heading for border
      above = '▄',
      -- Used below heading for border
      below = '▀',
      -- The 'level' is used to index into the array using a clamp
      -- Highlight for the heading icon and extends through the entire line
      backgrounds = {
        'RenderMarkdownH1Bg',
        'RenderMarkdownH2Bg',
        'RenderMarkdownH3Bg',
        'RenderMarkdownH4Bg',
        'RenderMarkdownH5Bg',
        'RenderMarkdownH6Bg',
      },
      -- The 'level' is used to index into the array using a clamp
      -- Highlight for the heading and sign icons
      foregrounds = {
        'RenderMarkdownH1',
        'RenderMarkdownH2',
        'RenderMarkdownH3',
        'RenderMarkdownH4',
        'RenderMarkdownH5',
        'RenderMarkdownH6',
      },
    },
    callout = {
      note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo' },
      tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess' },
      important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint' },
      warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn' },
      caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError' },
      -- Obsidian: https://help.obsidian.md/Editing+and+formatting/Callouts
      abstract = { raw = '[!ABSTRACT]', rendered = '󰨸 Abstract', highlight = 'RenderMarkdownInfo' },
      summary = { raw = '[!SUMMARY]', rendered = '󰨸 Summary', highlight = 'RenderMarkdownInfo' },
      tldr = { raw = '[!TLDR]', rendered = '󰨸 Tldr', highlight = 'RenderMarkdownInfo' },
      info = { raw = '[!INFO]', rendered = '󰋽 Info', highlight = 'RenderMarkdownInfo' },
      todo = { raw = '[!TODO]', rendered = '󰗡 Todo', highlight = 'RenderMarkdownInfo' },
      hint = { raw = '[!HINT]', rendered = '󰌶 Hint', highlight = 'RenderMarkdownSuccess' },
      success = { raw = '[!SUCCESS]', rendered = '󰄬 Success', highlight = 'RenderMarkdownSuccess' },
      check = { raw = '[!CHECK]', rendered = '󰄬 Check', highlight = 'RenderMarkdownSuccess' },
      done = { raw = '[!DONE]', rendered = '󰄬 Done', highlight = 'RenderMarkdownSuccess' },
      question = { raw = '[!QUESTION]', rendered = '󰘥 Question', highlight = 'RenderMarkdownWarn' },
      help = { raw = '[!HELP]', rendered = '󰘥 Help', highlight = 'RenderMarkdownWarn' },
      faq = { raw = '[!FAQ]', rendered = '󰘥 Faq', highlight = 'RenderMarkdownWarn' },
      attention = { raw = '[!ATTENTION]', rendered = '󰀪 Attention', highlight = 'RenderMarkdownWarn' },
      failure = { raw = '[!FAILURE]', rendered = '󰅖 Failure', highlight = 'RenderMarkdownError' },
      fail = { raw = '[!FAIL]', rendered = '󰅖 Fail', highlight = 'RenderMarkdownError' },
      missing = { raw = '[!MISSING]', rendered = '󰅖 Missing', highlight = 'RenderMarkdownError' },
      danger = { raw = '[!DANGER]', rendered = '󱐌 Danger', highlight = 'RenderMarkdownError' },
      error = { raw = '[!ERROR]', rendered = '󱐌 Error', highlight = 'RenderMarkdownError' },
      bug = { raw = '[!BUG]', rendered = '󰨰 Bug', highlight = 'RenderMarkdownError' },
      example = { raw = '[!EXAMPLE]', rendered = '󰉹 Example', highlight = 'RenderMarkdownHint' },
      quote = { raw = '[!QUOTE]', rendered = '󱆨 Quote', highlight = 'RenderMarkdownQuote' },
      cite = { raw = '[!CITE]', rendered = '󱆨 Cite', highlight = 'RenderMarkdownQuote' },
    },
  }

