# Notes
function notes-read
    ls ~/Documents/notes/ | grep -i "$argv" | head -1 | xargs -I @ less ~/Documents/notes/@
end

function notes-edit
    ls ~/Documents/notes/ | grep -i "$argv" | head -1 | tr -d '\n' | xargs -0 -I @ $EDITOR ~/Documents/notes/@
end

function notes-new
    eval $EDITOR ~/Documents/notes/"$argv"
end

function notes-search
    ls ~/Documents/notes/ | grep -i --color=always "$argv" | more -R
end

function notes-list
    # ls -htF ~/Documents/notes/ | less
    tree -tDrNi ~/Documents/notes/ | less -i
end

function notes
    if test (count $argv) -le 0
        notes list
        return
    end
    switch $argv[1]
        # commands
        case list
            if test (count $argv) -ge 2
                set --erase argv[1]
                notes-search $argv
            else
                notes-list
            end
        case new
            set --erase argv[1]
            notes-new $argv
        case read
            set --erase argv[1]
            notes-read $argv
        case edit
            set --erase argv[1]
            notes-edit $argv

        #aliases
        case r
            set --erase argv[1]
            notes read $argv
        case e
            set --erase argv[1]
            notes edit $argv
        case ls
            set --erase argv[1]
            notes list $argv
        case '*'
            notes list $argv
    end
end

