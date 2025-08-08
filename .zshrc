export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="wedisagree"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

export PATH="$PATH:/home/$USER/bin"
export PATH="$PATH:/home/$USER/go/bin"
export PATH="$PATH:/home/$USER/.local/bin"
export EDITOR=nvim
export QT_QPA_PLATFORMTHEME=qt6ct

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

source $ZSH/oh-my-zsh.sh

alias lf='yazi'
alias open='xdg-open'
alias nvimrc='nvim ~/.config/nvim/'
# Lofi girl 
alias lofi="mpv --no-video https://www.youtube.com/watch\?v\=jfKfPfyJRdk"

todo(){
    nvim ~/todo.txt
}

zshrc(){
    nvim ~/.zshrc
}


reload(){
    source ~/.zshrc
    echo "Reloaded zsh config"
}

notes(){
    nvim ~/notes.md
}

tmp(){
    mkdir -p /tmp/tmp 
    cd /tmp/tmp
}


cosa() {
   env | grep COREOS_ASSEMBLER
   local -r COREOS_ASSEMBLER_CONTAINER_LATEST="quay.io/coreos-assembler/coreos-assembler:latest"
   if [[ -z ${COREOS_ASSEMBLER_CONTAINER} ]] && $(podman image exists ${COREOS_ASSEMBLER_CONTAINER_LATEST}); then
       local -r cosa_build_date_str="$(podman inspect -f "{{.Created}}" ${COREOS_ASSEMBLER_CONTAINER_LATEST} | awk '{print $1}')"
       local -r cosa_build_date="$(date -d ${cosa_build_date_str} +%s)"
       if [[ $(date +%s) -ge $((cosa_build_date + 60*60*24*7)) ]] ; then
         echo -e "\e[0;33m----" >&2
         echo "The COSA container image is more that a week old and likely outdated." >&2
         echo "You should pull the latest version with:" >&2
         echo "podman pull ${COREOS_ASSEMBLER_CONTAINER_LATEST}" >&2
         echo -e "----\e[0m" >&2
         sleep 10
       fi
   fi
   set -x
   podman run --rm -ti --security-opt=label=disable --privileged                                        \
              --userns=keep-id:uid=1000,gid=1000                                                        \
              -v=${PWD}:/srv/ -v=$HOME/.local/share/containers:/home/builder/.local/share/containers    \
              --device=/dev/kvm --device=/dev/fuse                                                      \
              --tmpfs=/tmp -v=/var/tmp:/var/tmp --name=cosa                                             \
              ${COREOS_ASSEMBLER_CONFIG_GIT:+-v=$COREOS_ASSEMBLER_CONFIG_GIT:/srv/src/config/:ro}       \
              ${COREOS_ASSEMBLER_GIT:+-v=$COREOS_ASSEMBLER_GIT/src/:/usr/lib/coreos-assembler/:ro}      \
              ${COREOS_ASSEMBLER_ADD_CERTS:+-v=/etc/pki/ca-trust:/etc/pki/ca-trust:ro}                  \
              ${COREOS_ASSEMBLER_CONTAINER_RUNTIME_ARGS}                                                \
              ${COREOS_ASSEMBLER_CONTAINER:-$COREOS_ASSEMBLER_CONTAINER_LATEST} "$@"
   rc=$?; set +x; return $rc
}

eval "$(zoxide init zsh)"
