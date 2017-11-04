VIM主题颜色配置
256-jungle.vim

对VIM恋恋不忘，最早在大学接触VIM，当时是在Linux课程上用到，当时只是知道可以用VIM打开一些文件。

14年出来工作后用VS2012开发，然后用Eclipse,Android Studio ,因为现在用lua语言，有没有现成的IDE，在编辑器中有三种选择VIM，Atom，Sublime

然后到网上找用哪种编辑工具开发，我感觉我走了很多的弯路，但是这些弯路走的有点不值得。主要还是认知的不足

对VIM的不熟。不知道怎么去更好额配置VIM，不知遇到问题，首先想到的不是
如何去解决它。而是打退堂鼓。遇到难一点问题，就开始停滞不前。没有
专研的精神。这个问题认真的思考了一下。以前我是这样处理的，遇到问题就
先放一放。就是这样造成了现在的我，遇到问题而不是解决它，就是退缩，
说的好听的是放一放，其实就是推延。

从现在开始，遇到问题一定要解决。知其然，知其所以然。

如果知道是最好的，就一定照着这条路走下去。再痛苦也要走下去。

做事就要集中

“程序员的主要问题与其说是技术问题，还不如说是心理问题：他不能解决问题，是因为他企图解决错误的问题。问题的最终解决，是通过打破他的概念壁垒，进而去解决一个较简单的问题而实现的。”

那就现在来安装VIM

1. 首先遇到的难题

需要VIM支持lua, 这个问题都困扰了我几天。

网上的解决方案是VIM重新编译支持lua,不行有点复杂，难道就没有编译好的VIM就含有对lua的支持

brew install vim 

安装后，打开vim 还是系统自带的vim版本，然后网上查找覆盖自带的vim

然后看到这个链接：https://www.zhihu.com/question/34113076

终端：brew install vim --with-lua --with-override-system-vi
GUI：brew install macvim --with-lua --with-override-system-vim

然要查看vim支不支持lua，

1.
打开vim，在命令模式输入“:version”即可以看到vim的一些版本和编译信息，其中"+lua"表示支持lua，"-lua"表示不支持lua后查看VIM是否支持

2.打开vim，在命令模式输入 echo has("lua") 打印1表示支持lua

2. VIM的配置问题

VIM的配置真的复杂，不是一个刚入手VIM的菜鸟所能

然后找到了 spf13-vim

然后就是这篇：http://harrycode.logdown.com/tags/Vim

然后就是如何再spf13-vim 的基础上添加对lua更好的支持

新建立 ~/vimrc.local 与 ~/.vimrc.bundles.local

在 ~/.vimrc.bundles.local 添加如下

Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-lua-ftplugin'
Bundle 'tbastos/vim-lua'
Bundle 'WolfgangMehner/lua-support'
Bundle 'u0u0/vim-quick-cocos2d-x'

在 ~/.vimrc.local 中添加如下

" Lua{
    let g:lua_syntax_someoption = 1

  " }

" Quick-Cocos2d{
    let g:cocos2dx_diction_location = '~/.vim/bundle/vim-quick-cocos2d-x/key-dict'
" }

3. 设置Quick-Cocos2d 的VIM的开发环境

看到这篇：http://yi.github.io/work/2014/06/20/在MacOS上设置quickx和cocos2dx的Vim开发环境/

4. catgs 对lua的支持不怎么好，这是一个很重要的问题，严重阻碍lua的开发

当时一直不知道怎么办。这就造成了一直在用atom, 但是atom也没有跳转

然后搜索了下，ctags lua 支持, 还真有

看这篇：https://dingmingxin.github.io/blog/2016/05/05/程序员的七种武器之ctags/

https://gist.github.com/yongkangchen/10120546
http://noyesno.net/page/ctags/support-go.html


但是mac 中没有搜索到 .ctags 这个文件，那就只有自己建一个了。也不知道
行不行

~/.catgs 添加如下

--langdef=MYLUA
--langmap=MYLUA:.lua
--regex-MYLUA=/newClass\(\'([^ ]+)\',.*/\1/c/
--regex-MYLUA=/.*subclass\([\'\"]([^ ]+)[\'\"]\)/\1/c/
--regex-MYLUA=/[ ]?([a-zA-Z_]+)Layout[ ]?=.*/\1/c/
--regex-MYLUA=/[ ]?([a-zA-Z_]+Layout)[ ]?=.*/\1/c/
--regex-MYLUA=/^([^:.= ]+)[ =]+\{\}/\1/c/
--regex-MYLUA=/^function[ ]+[^:]+:([^ \(]+)/\1/f/
--regex-MYLUA=/^function[ ]+([^:. ]+)\(/\1/f/
--regex-MYLUA=/^function[ ]+[^:]+\.([a-zA-Z_]+)\(/\1/f/
--regex-MYLUA=/^function[ ]+[^:.]+\.class:([a-zA-Z_]+)\(/\1/f/
--regex-MYLUA=/[ ]?local[ ]+function[ ]+([^:.= ]+)\(/\1/f/
--regex-MYLUA=/[ ]?local[ ]+([a-zA-Z_]+)[ ]?=[ ]?function\(/\1/f/
--regex-MYLUA=/([^ ]+)[ ]+=[a-zA-z_ ]+or[ ]+{}/\1/m/
--regex-MYLUA=/.*:mapEvent\(([^,:]+)[, ]+[^ ,:_]+\).*/\1/e/
--regex-MYLUA=/([ ]?[a-zA-Z_-]+)[ ]?=[ ]?InitStaticInt.*/\1/e/

--regex-MYLUA=/^.*\s*function[ \t]*([a-zA-Z0-9_]+):([a-zA-Z0-9_]+).*$/\2/f,function/
--regex-MYLUA=/^.*\s*function[ \t]*([a-zA-Z0-9_]+)\.([a-zA-Z0-9_]+).*$/\2/f,function/
--regex-MYLUA=/^.*\s*function[ \t]*([a-zA-Z0-9_]+)\s*\(.*$/\1/f,function/
--regex-MYLUA=/([a-zA-Z0-9_]+) = require[ (]"([^"]+)"/\1/r,require/
--regex-MYLUA=/[ \t]{1}([a-zA-Z0-9_]+)[ \t]*[=][^=]/\1/v,variable/
--regex-MYLUA=/[ \t]*([a-zA-Z0-9_]+)[ \t]*=[ \t]*module_define.*$/\1/m,module/
--regex-MYLUA=/func_table\[ msg\.([A-Z_]+) \].+/\1/
--regex-MYLUA=/\([ \t]*msg.([A-Z_]+)[ \t]*\)/\1/




http://www.cnblogs.com/jianyungsun/archive/2011/01/20/1940262.html
http://www.xinxingzhao.com/blog/2016/05/15/vim-NERDTree.html

