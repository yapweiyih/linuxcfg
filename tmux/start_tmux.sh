#################
# Setup config file
#################
TMUX_CONFIG="/home/ec2-user/.tmux.conf"

cat > ${TMUX_CONFIG} << EOL
# Change default prefix (C-b) to C-a
unbind-key C-b
set -g prefix C-a
bind-key C-a send-prefix

# This set the base index for windows within a session.
set -g base-index 1

set-window-option -g automatic-rename off
set-option -g set-titles off
setw -g allow-rename off

# Use vi key in copy mode
set -g mode-keys vi

# Increase history recorded in copy mode
set -g history-limit 10000

# Once bind, need to use 'unbind' to remove
bind J resize-pane -D 5
bind K resize-pane -U 5
bind H resize-pane -L 5
bind L resize-pane -R 5

# Reload tmux config
bind r source-file ~/.tmux.conf\; display-message "~/.tmux.conf reloaded..."

# THEME
set -g status-bg black
set -g status-fg white

# Update the status line every interval seconds
set -g status-interval 60


# Shift arrow to switch windows
bind -n S-Left  previous-window
bind -n S-Right next-window
EOL


#################
# Start  tmux
#################
tmux new-session -s weiyih -n editor -d
tmux new-window -n top -d
tmux new-window -n nvidia -d
tmux new-window -n jupyter

# Split
#tmux split-window -v -t weiyih:top

# Send command to be executed in a specified pane => session(weiyih):windows(1):pane(start from 0)
# Sample command:
# watch -n0.5 nvidia-smi
# htop
tmux send-keys -t weiyih:editor 'source activate pytorch_p36' C-m
tmux send-keys -t weiyih:top 'htop' C-m
tmux send-keys -t weiyih:nvidia 'watch -n0.5 nvidia-smi' C-m
tmux send-keys -t weiyih:jupyter 'jupyter notebook --port 8889' C-m
tmux attach -t weiyih \; select-window -t editor