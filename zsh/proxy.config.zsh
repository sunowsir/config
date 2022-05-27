function zsh_proxy_setup() {
    [[ ! -d ~/.cache/zsh/ ]] && 
        mkdir ~/.cache/zsh/  && 
        echo "zsh_proxy_setup on" > ~/.cache/zsh/zsh_proxy_setup

    case ${1} in 
        "on")
            # export http_proxy=http://127.0.0.1:8889
            # export https_proxy=https://127.0.0.1:8889
            export http_proxy="socks5://127.0.0.1:1089"
            export https_proxy="socks5://127.0.0.1:1089"
            echo "zsh_proxy_setup on" > ~/.cache/zsh/zsh_proxy_setup
        ;;
        "off")
            export http_proxy=""
            export https_proxy=""
            echo "zsh_proxy_setup off" > ~/.cache/zsh/zsh_proxy_setup
        ;;
    esac
    echo "[http_proxy=${http_proxy}]"
    echo "[http_proxys=${https_proxy}]"
}

[[ ! -d ~/.cache/zsh/ ]] && 
    mkdir ~/.cache/zsh/  && 
    echo "zsh_proxy_setup on" > ~/.cache/zsh/zsh_proxy_setup
