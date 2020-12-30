###############################################################################
# Byobu tmux file edit original in `/usr/share/byobu/profiles/tmux`
###############################################################################

# Initialize environment, clean up
set-environment -g BYOBU_BACKEND tmux
new-session -d byobu-janitor
set -s escape-time 0

# Change to Screen's ctrl-a escape sequence and use screen-like keys
source $BYOBU_PREFIX/share/byobu/keybindings/tmux-screen-keys.conf

# Add ^A, F12 to the prefix list
set -g prefix ^A
# Note, prefix2 only available in tmux 1.6+
set -g prefix2 F12

# Byobu's Keybindings
source $BYOBU_PREFIX/share/byobu/keybindings/f-keys.tmux
set-window-option -g xterm-keys on

#set-option -g set-titles on
#set-option -g set-titles-string '#(whoami)@#H - byobu (#S)'
set-option -g pane-active-border-style bg=$BYOBU_HIGHLIGHT,fg=$BYOBU_HIGHLIGHT
set-option -g pane-border-style fg=$BYOBU_ACCENT
set-option -g history-limit 200000
set-option -g display-panes-time 150
set-option -g display-panes-colour $BYOBU_ACCENT
set-option -g display-panes-active-colour $BYOBU_HIGHLIGHT
set-option -g clock-mode-colour $BYOBU_ACCENT
set-option -g clock-mode-style 24
set-option -g mode-keys vi
set-option -g mode-style bg=$BYOBU_ACCENT,fg=$BYOBU_LIGHT

set-window-option -g window-status-style default
set-window-option -g window-status-style bg=$BYOBU_DARK,fg=$BYOBU_LIGHT
set-window-option -g window-status-current-style bg=$BYOBU_DARK,fg=$BYOBU_LIGHT,reverse
set-window-option -g window-status-activity-style bg=$BYOBU_DARK,fg=$BYOBU_LIGHT,bold
set-window-option -g automatic-rename on
set-window-option -g aggressive-resize on
set-window-option -g monitor-activity on

set -g default-terminal "$BYOBU_TERM"

#My key prefs
set -s escape-time 10
set -sg repeat-time 600

#Index starts 1

set -g base-index 1
setw -g pane-base-index 1
set -g renumber-windows on


# The following helps with Shift-PageUp/Shift-PageDown
set-option -g terminal-overrides 'xterm*:smcup@:rmcup@'

# Must set default-command to $SHELL, in order to not source ~/.profile
# BUG: Should *not* hardcode /bin/bash here
# Use byobu-shell here, to show MOTD, but would do so with every new window and split
#set -g default-command 'exec byobu-shell'
set -g default-command $SHELL

set -g status-style bg=$BYOBU_DARK,fg=$BYOBU_LIGHT
set -g status-interval 1
set -g status-left-length 256
set -g status-right-length 256
set -g status-left '#(byobu-status tmux_left)'
set -g status-right '#(byobu-status tmux_right)'$BYOBU_DATE$BYOBU_TIME
set -g message-style bg=$BYOBU_ACCENT,fg=white


# List of plugins                                              
set -g @plugin 'tmux-plugins/tpm'                              
set -g @plugin 'tmux-plugins/tmux-sensible'                                                                                    
set -g @plugin 'tmux-plugins/tmux-resurrect'                                                                                   
set -g @plugin 'tmux-plugins/tmux-continuum'                                                                                   


#Plugin configs                                                
set -g @continuum-restore 'on'                                 
set -g @continuum-save-interval '1'                            


# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)                                                                                                                                                                              
run -b '~/.tmux/plugins/tpm/tpm' 
