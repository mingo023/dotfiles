# Display informative Git status in the prompt (e.g., branch name, dirty state, etc.).
set -g __fish_git_prompt_show_informative_status true

# Show color hints in the Git prompt for different Git states (e.g., dirty, staged, conflicted).
set -g __fish_git_prompt_showcolorhints true

# Show verbose information about the upstream status in the Git prompt.
set -g __fish_git_prompt_showupstream verbose

# Colors for various Git states.
#   Change color codes as desired.
#   Valid colors are: (https://fishshell.com/docs/current/cmds/set_color.html)
#   You can use `set_color -c` to see a list of all valid colors.
#     Regular: [black, red, green, yellow, blue, magenta, cyan, white]
#     Bright Colors, [brred, brgreen, bryellow, brblue, brmagenta, brcyan, brwhite]

set -g __fish_git_prompt_color_branch brmagenta -i # -i Sets italics mode.
set -g __fish_git_prompt_color_dirtystate white
set -g __fish_git_prompt_color_invalidstate brred
set -g __fish_git_prompt_color_merging yellow
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_upstream_ahead green
set -g __fish_git_prompt_color_upstream_behind brred

# Icons for various local Git states
set -g __fish_git_prompt_char_cleanstate ' 👍  '
set -g __fish_git_prompt_char_conflictedstate ' 😭 '
set -g __fish_git_prompt_char_dirtystate ' 💩  '
set -g __fish_git_prompt_char_invalidstate ' 🤮  '
set -g __fish_git_prompt_char_stagedstate ' 🚥  '
set -g __fish_git_prompt_char_stashstate ' 📦  '
set -g __fish_git_prompt_char_stateseparator ' | '
set -g __fish_git_prompt_char_untrackedfiles ' 🔍  '

# upstream status if __fish_git_prompt_showupstream is set to verbose
set -g __fish_git_prompt_char_upstream_ahead ' 👆 '
set -g __fish_git_prompt_char_upstream_behind ' 👇  '
set -g __fish_git_prompt_char_upstream_diverged ' 🚧  '
set -g __fish_git_prompt_char_upstream_equal ' 💯 '


# This is the function that actually sets the prompt.
function fish_prompt
  # Set the color of the current working directory in the prompt.
  set_color green

  # Print the current working directory.
  printf '%s' (prompt_pwd)

  # Reset the color to normal for the rest of the prompt.
  set_color normal

  # Print the Git prompt using the fish_git_prompt function (provided by Fish).
  printf '%s ' (fish_git_prompt)

  # Print a fish icon at the end of the prompt just for fun.
  # Change to whatever you want, or remove it entirely.
  # echo -n "--> "
  echo -n "🐠  "

  # Reset the color to normal for any subsequent output.
  set_color normal
end
