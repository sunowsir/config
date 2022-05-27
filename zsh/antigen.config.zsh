if [[ ! -f "${ZSH_CONFIG_DIR}/antigen.zsh" ]]; then
    curl https://cdn.jsdelivr.net/gh/zsh-users/antigen@develop/bin/antigen.zsh > "${ZSH_CONFIG_DIR}/antigen.zsh"  
    chmod +x "${ZSH_CONFIG_DIR}/antigen.zsh"
fi

source "${ZSH_CONFIG_DIR}/antigen.zsh"

#
##############################################  antigen 
#

# --------------------- lib

# 加载oh-my-zsh库
antigen use oh-my-zsh

# --------------------- lib plug

# git 辅助插件
antigen bundle git

# git 插件的增强版
antigen bundle gitfast

# keroku 命令补全插件
antigen bundle heroku

# pip 命令补全插件
antigen bundle pip

# npm 命令补全插件
antigen bundle npm

# 双击esc 快速在命令前面加上或去掉sudo
antigen bundle sudo 

# 不知为何物
# antigen bundle lein

# 未知命令提示插件
antigen bundle command-not-found

# 快速解压缩插件 
antigen bundle extract

# terminal下快速使用搜索引擎调用默认浏览器搜索
antigen bundle web-search

# 以标准输出显示图片
# antigen bundle catimg

# 拷贝文件内容到剪切板 -- 需要安装xclip
antigen bundle copyfile


# please to see : https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins to get more oh-my-zsh plug information.

# --------------------- other plug

# 语法高亮功能
antigen bundle zsh-users/zsh-syntax-highlighting

# 代码提示功能
antigen bundle zsh-users/zsh-autosuggestions

# 自动补全功能
antigen bundle zsh-users/zsh-completions

# 为man手册着色
antigen bundle ael-code/zsh-colored-man-pages

antigen bundle vi-mode

# --------------------- theme 

# 加载主题
antigen theme robbyrussell

# --------------------- setting

# 保存更改
antigen apply

#
############################################### persional setting
#
