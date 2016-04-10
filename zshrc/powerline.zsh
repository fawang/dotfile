# By default, at the right of the powerline are displayed the date and the time. If you don't want date or time, you can choose what you want to display:
# POWERLINE_RIGHT_B="time repla#c#e#m#e#n#t#"
##
# Or if you don't want to display anything:
# POWERLINE_RIGHT_B="none"

# If you want to display date next to time:
# POWERLINE_RIGHT_A="date"

# If you want to display exit-code of last command next to time:
# POWERLINE_RIGHT_A="exit-status"
# or if you want it to appear only on faulty runs:
# POWERLINE_RIGHT_A="exit-status-on-fail"
# If you want to display date or non-zero-exit-code of last command next to time:
POWERLINE_RIGHT_A="mixed"

# If you want to display a custom text next to time:
# POWERLINE_RIGHT_A="blackfire.io"

# If you want to change the color of the POWERLINE_RIGHT_A element:
# POWERLINE_RIGHT_A_COLOR_FRONT="black"
# POWERLINE_RIGHT_A_COLOR_BACK="red"

# If you want to change the date format to what you want:
# POWERLINE_DATE_FORMAT="%D{%d-%m}"

# If you don't want to display your username (the green or red (root) colors are still there):
POWERLINE_HIDE_USER_NAME="true"

# If you don't want to display your hostname (the green or red (root) colors are still there):
POWERLINE_HIDE_HOST_NAME="true"

# If you only want to see the first part of the hostname (not the fqdn):
# POWERLINE_SHORT_HOST_NAME="true"

# If you want to hide git prompt status (new files, modified files, unmerged files, etc):
# POWERLINE_HIDE_GIT_PROMPT_STATUS="true"

# If you want to hide the right hand side prompt completely:
# POWERLINE_DISABLE_RPROMPT="true"

# If you don't want the blank line before the prompt:
POWERLINE_NO_BLANK_LINE="true"

# If you want full path:
POWERLINE_PATH="full"

# If you want to display ~ instead of your full path:
# POWERLINE_PATH="short"
# If you want to customize the current path display (overrides full path above):
# POWERLINE_CUSTOM_CURRENT_PATH="%3~"

# If you want git info on right instead of left:
POWERLINE_SHOW_GIT_ON_RIGHT="true"

# If you want to tell if you are in a remote SSH session:
POWERLINE_DETECT_SSH="true"

# Also you can change the icons of GIT info, default values are:
# POWERLINE_GIT_CLEAN="✔"
# POWERLINE_GIT_DIRTY="✘"
# POWERLINE_GIT_ADDED="%F{green}✚%F{black}"
# POWERLINE_GIT_MODIFIED="%F{blue}✹%F{black}"
# POWERLINE_GIT_DELETED="%F{red}✖%F{black}"
# POWERLINE_GIT_UNTRACKED="%F{yellow}✭%F{black}"
# POWERLINE_GIT_RENAMED="➜"
# POWERLINE_GIT_UNMERGED="═"
