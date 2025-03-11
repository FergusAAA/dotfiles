# ***stow*** 管理```.dotfiles```操作指南
## 应用.dotfile
``` shell
# 将zsh目录下的内容应用到跟路径
# -v (--verbose): 详细模式,显示操作过程中的详细信息.
# -t (--target): 指定目标目录,即符号链接的生成位置.
# zsh: 要操作的处理的配置文件子目录.
cd ~/.dotfiles
stow -v -t ~ zsh
```



## 将配置文件纳入管理.

1. 在.dotfiles中新建对应的配置文件子目录.

   ```shell
   cd ~/.dotfiles
   mkdir zsh
   ```

   

2. 将原有配置文件移动到到``.dotfiles``里

   ```shell
   mv ~/.zshrc zsh
   ```

3. 建立符号连接管理配置

   ```shell
   stow -v -t ~ zsh
   ```

   
