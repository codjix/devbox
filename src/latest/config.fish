if status is-interactive
    # Commands to run in interactive sessions can go here
end

source (starship init fish --print-full-init | psub)

alias cls "clear"
alias xzz "xz -f9 -T0"
alias ports "netstat -antpl"
alias ll "lsd -lh --group-directories-first"
alias lsx "lsd -lh --group-directories-first --total-size"
alias la "lsd -lh --group-directories-first -A"