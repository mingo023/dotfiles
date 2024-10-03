require("codecompanion").setup({
  adapters = {
    anthropic = "anthropic",
    copilot = "copilot",
    gemini = "gemini",
    ollama = "ollama",
    openai = "openai",
    opts = {
      allow_insecure = false, -- Allow insecure connections?
      proxy = nil, -- [protocol://]host[:port] e.g. socks5://127.0.0.1:9999
    },
  },
  prompt_library = {
    ["Custom Prompt"] = {
      strategy = "inline",
      description = "Prompt the LLM from Neovim",
      opts = {
        index = 3,
        default_prompt = true,
        mapping = "<LocalLeader>cc",
        user_prompt = true,
      },
      prompts = {
        {
          role = "system",
          content = function(context)
            return string.format(
              [["I want you to act as a senior %s developer. I will ask you specific questions and I want you to return raw code only (no codeblocks and no explanations). If you can't respond with code, respond with nothing]],
              context.filetype
            )
          end,
          opts = {
            visible = false,
            tag = "system_tag",
          },
        },
      },
    },
    ["Explain"] = {
      strategy = "chat",
      description = "Explain how code in a buffer works",
      opts = {
        index = 4,
        default_prompt = true,
        mapping = "<LocalLeader>ce",
        modes = { "v" },
        slash_cmd = "explain",
        auto_submit = true,
        user_prompt = false,
        stop_context_insertion = true,
      },
      prompts = {
        {
          role = "system",
          content = [[When asked to explain code, follow these steps:

1. Identify the programming language.
2. Describe the purpose of the code and reference core concepts from the programming language.
3. Explain each function or significant block of code, including parameters and return values.
4. Highlight any specific functions or methods used and their roles.
5. Provide context on how the code fits into a larger application if applicable.]],
          opts = {
            visible = false,
          },
        },
        {
          role = "user",
          content = function(context)
            local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

            return string.format(
              [[Please explain this code:

```%s
%s
```
]],
              context.filetype,
              code
            )
          end,
          opts = {
            contains_code = true,
          },
        },
      },
    },
    ["Unit Tests"] = {
      strategy = "chat",
      description = "Generate unit tests for the selected code",
      opts = {
        index = 5,
        default_prompt = true,
        mapping = "<LocalLeader>ct",
        modes = { "v" },
        slash_cmd = "tests",
        auto_submit = true,
        user_prompt = false,
        stop_context_insertion = true,
      },
      prompts = {
        {
          role = "system",
          content = [[When generating unit tests, follow these steps:

1. Identify the programming language.
2. Identify the purpose of the function or module to be tested.
3. List the edge cases and typical use cases that should be covered in the tests and share the plan with the user.
4. Generate unit tests using an appropriate testing framework for the identified programming language.
5. Ensure the tests cover:
      - Normal cases
      - Edge cases
      - Error handling (if applicable)
6. Provide the generated unit tests in a clear and organized manner without additional explanations or chat.]],
          opts = {
            visible = false,
          },
        },
        {
          role = "user",
          content = function(context)
            local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

            return string.format(
              [[Please generate unit tests for this code:

```%s
%s
```
]],
              context.filetype,
              code
            )
          end,
          opts = {
            contains_code = true,
          },
        },
      },
    },
    ["Fix code"] = {
      strategy = "chat",
      description = "Fix the selected code",
      opts = {
        index = 6,
        default_prompt = true,
        mapping = "<LocalLeader>cf",
        modes = { "v" },
        slash_cmd = "fix",
        auto_submit = true,
        user_prompt = false,
        stop_context_insertion = true,
      },
      prompts = {
        {
          role = "system",
          content = [[When asked to fix code, follow these steps:

1. **Identify the Issues**: Carefully read the provided code and identify any potential issues or improvements.
2. **Plan the Fix**: Describe the plan for fixing the code in pseudocode, detailing each step.
3. **Implement the Fix**: Write the corrected code in a single code block.
4. **Explain the Fix**: Briefly explain what changes were made and why.

Ensure the fixed code:

- Includes necessary imports.
- Handles potential errors.
- Follows best practices for readability and maintainability.
- Is formatted correctly.

Use Markdown formatting and include the programming language name at the start of the code block.]],
          opts = {
            visible = false,
          },
        },
        {
          role = "user",
          content = function(context)
            local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

            return string.format(
              [[Please fix this code:

```%s
%s
```
]],
              context.filetype,
              code
            )
          end,
          opts = {
            contains_code = true,
          },
        },
      },
    },
    ["Buffer selection"] = {
      strategy = "inline",
      description = "Send the current buffer to the LLM as part of an inline prompt",
      opts = {
        index = 7,
        modes = { "v" },
        default_prompt = true,
        mapping = "<LocalLeader>cb",
        slash_cmd = "buffer",
        auto_submit = true,
        user_prompt = true,
        stop_context_insertion = true,
      },
      prompts = {
        {
          role = "system",
          content = function(context)
            return "I want you to act as a senior "
              .. context.filetype
              .. " developer. I will ask you specific questions and I want you to return raw code only (no codeblocks and no explanations). If you can't respond with code, respond with nothing."
          end,
          opts = {
            visible = false,
            tag = "system_tag",
          },
        },
        {
          role = "user",
          content = function(context)
            local buf_utils = require("codecompanion.utils.buffers")

            return "```" .. context.filetype .. "\n" .. buf_utils.get_content(context.bufnr) .. "\n```\n\n"
          end,
          opts = {
            contains_code = true,
            visible = false,
          },
        },
        {
          role = "user",
          condition = function(context)
            return context.is_visual
          end,
          content = function(context)
            local selection = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

            return string.format(
              [[And this is some code that relates to my question:

```%s
%s
```
]],
              context.filetype,
              selection
            )
          end,
          opts = {
            contains_code = true,
            visible = true,
            tag = "visual",
          },
        },
      },
    },
    ["Explain LSP Diagnostics"] = {
      strategy = "chat",
      description = "Explain the LSP diagnostics for the selected code",
      opts = {
        index = 8,
        default_prompt = true,
        mapping = "<LocalLeader>cl",
        modes = { "v" },
        slash_cmd = "lsp",
        auto_submit = true,
        user_prompt = false,
        stop_context_insertion = true,
      },
      prompts = {
        {
          role = "system",
          content = [[You are an expert coder and helpful assistant who can help debug code diagnostics, such as warning and error messages. When appropriate, give solutions with code snippets as fenced codeblocks with a language identifier to enable syntax highlighting.]],
          opts = {
            visible = false,
          },
        },
        {
          role = "user",
          content = function(context)
            local diagnostics = require("codecompanion.helpers.actions").get_diagnostics(
              context.start_line,
              context.end_line,
              context.bufnr
            )

            local concatenated_diagnostics = ""
            for i, diagnostic in ipairs(diagnostics) do
              concatenated_diagnostics = concatenated_diagnostics
                .. i
                .. ". Issue "
                .. i
                .. "\n  - Location: Line "
                .. diagnostic.line_number
                .. "\n  - Severity: "
                .. diagnostic.severity
                .. "\n  - Message: "
                .. diagnostic.message
                .. "\n"
            end

            return string.format(
              [[The programming language is %s. This is a list of the diagnostic messages:

%s
]],
              context.filetype,
              concatenated_diagnostics
            )
          end,
        },
        {
          role = "user",
          content = function(context)
            local code = require("codecompanion.helpers.actions").get_code(
              context.start_line,
              context.end_line,
              { show_line_numbers = true }
            )
            return string.format(
              [[This is the code, for context:

```%s
%s
```
]],
              context.filetype,
              code
            )
          end,
          opts = {
            contains_code = true,
          },
        },
      },
    },
    ["Generate a Commit Message"] = {
      strategy = "chat",
      description = "Generate a commit message",
      opts = {
        index = 9,
        default_prompt = true,
        mapping = "<LocalLeader>cm",
        slash_cmd = "commit",
        auto_submit = true,
      },
      prompts = {
        {
          role = "user",
          content = function()
            return string.format(
              [[You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me:

```diff
%s
```
]],
              vim.fn.system("git diff --stagged")
            )
          end,
          opts = {
            contains_code = true,
          },
        },
      },
    },
  },
  strategies = {
    -- CHAT STRATEGY ----------------------------------------------------------
    chat = {
      adapter = "copilot",
      roles = {
        llm = "CodeCompanion", -- The markdown header content for the LLM's responses
        user = "Me", -- The markdown header for your questions
      },
    },
    inline = {
      adapter = "copilot",
      keymaps = {
        accept_change = {
          modes = {
            n = "ga",
          },
          index = 1,
          callback = "keymaps.accept_change",
          description = "Accept change",
        },
        reject_change = {
          modes = {
            n = "gr",
          },
          index = 2,
          callback = "keymaps.reject_change",
          description = "Reject change",
        },
      },
      prompts = {
        -- The prompt to send to the LLM when a user initiates the inline strategy and it needs to convert to a chat
        inline_to_chat = function(context)
          return "I want you to act as an expert and senior developer in the "
            .. context.filetype
            .. " language. I will ask you questions, perhaps giving you code examples, and I want you to advise me with explanations and code where neccessary."
        end,
      },
    },
  },
})
