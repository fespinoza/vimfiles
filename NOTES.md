# Vim Notes

## Commands
* Ag [options] {patern} [{directory}]

## Normal Mode

* pressing '#' will search the word under the cursor
* <Shift>j will merge the lines under the current line into this one

## Visual Mode

* Ctrl+c for copying into the system clipboard

## Spell Checking

* enabling spell check `setlocal spell spelllang=en_us`
* navigate to next/previous spell error `]s`, `[s`
* show spelling sugerences for the word under the cursor `z=`
* add a word to the dictionary `zg`

# Tmux Notes

## windows
tmux new-window (prefix + c)               :  create a new window
tmux select-window -t :0-9 (prefix + 0-9)  :  move to the window based on index
tmux rename-window (prefix + ,)            :  rename the current window

## panes
tmux split-window (prefix + ")            :  splits the window into two vertical panes
tmux split-window -h (prefix + %)         :  splits the window into two horizontal panes
tmux swap-pane -[UDLR] (prefix + { or })  :  swaps pane with another in the specified direction
tmux select-pane -[UDLR]                  :  selects the next pane in the specified direction
tmux select-pane -t :.+                   :  selects the next pane in numerical order")
