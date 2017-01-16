工欲善其事必先利其器

如果真的想要舒适方便地翻译的话，`复制粘贴原文 -> 翻译 -> 将翻译的内容整理出来` 这种流程我想大概是无法接受的。中间满满的体力劳动，并且`手工 <-> 出错`，另外，对于翻译的话也是有一些通用的文件格式的（比如 po(t),tmx 等，和 html,markdown 相似，也是带标签的文本）。还有，自从尝试了 markdown 之后，我认为所有能它来做的工作就不要考虑其他的了，当然，默认的 markdown 格式还是有一些不足够的，就比如说页内引用（锚点、reference），但一些拓展格式比如说 php markdown extra 等有不错的解决方案（请不要说可以使用 html 标签来实现，那不可以忍，不过 github 使用的也是这种形式，让我有点伤）。所以找些软件/库形成一个自以为还可以接受的工作流：


其中用到的软件与库主要包括：

* [pandoc,the `Universal markup converter`](https://github.com/jgm/pandoc)
我们拿到手的待翻译内容大都是文本且以网页居多，这时候就需要能有一个很方便的转化格式的方法。幸运的是，`pandoc` 真的提供了一个让人愉悦的方式，上面提到了基础的 md 格式对锚点的支持很不友好，所以我推荐使用 php markdown extra （或者是 GitHub-Flavored Markdown）格式，这里给出一个例子：

``` vi
# 源文件在 anchor.html，注意下面中的 `id` 与 `name` 的区别，使用 pandoc 不能正确的识别 `name`

<a id="A1">The first anchor, blablabla</a>

<a name="A2">The second anchor, blablabla</a> 
```

``` vi
$ pandoc -f html -t markdown_phpextra anchor.html -o anchor.html.md 
```

其中 `markdown_phpextra` 可以为：

`markdown (pandoc way),markdown_phpextra (PHP Markdown Extra),markdown_github (GitHub-Flavored Markdown),markdown_mmd (MultiMarkdown),markdown_strict (Markdown.pl)`

可以尝试一下，个人还是建议 PHP 以及 github 的方式。

我们在转换后返现 `A2` 并不能正常的转义，所以，如果有需要请将原 html 中的 `name` 锚点转为 `id`（也许程序可以解决这个问题，有待考察）。


* [简洁的 markdown 编辑器 Smark](https://github.com/elerao/Smark) 与 [windows 下的`全能` md 编辑器 MarkDownEditor](https://github.com/chenguanzhou/MarkDownEditor)

编辑器并非是必须的，毕竟 sublime 写 md 都会被使用 vim 的嘲笑呢~，但前者是使用 pandoc 来预览，后者界面非常清爽（仅支持 win*），都值得一看。

* [https://translate.zanata.org/](https://translate.zanata.org/) 
与 [https://github.com/translate](https://github.com/translate)

提供了在同一个网页上完成翻译的完整的 workflow，页面可以说是简约而绚丽（辞藻有限，抱歉 -.-），但服务器在国外速度不好，但有 docker 文件提供（还未尝试）。后者对开发者很友好，提供了一**套**完整的开源产品（注意是一套）。


这里还是以 `translate` 来介绍，


* [https://poedit.net/](https://poedit.net/)，我觉得还是使用


* http://po4a.alioth.debian.org/
