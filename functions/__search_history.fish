function __search_history -d "Search and reuse commands from history"
    if not command -sq fzf
        echo 'Error: __search_history needs fzf command.'
    end
    builtin history -z | fzf --read0 --no-sort --query (commandline) | read -z selected
    and commandline (builtin string trim "$selected")
    commandline -f repaint
end
