# 项目说明

本项目分叉 (forked) 自 [fanhongtao/ebooks](https://github.com/fanhongtao/ebooks)。我增加了 GNU make 所需的 Makefile 文件，只需在主目录下执行以下命令即可进行编译：

```sh
make install -j
```

---

# 原项目 ([fanhongtao/ebooks](https://github.com/fanhongtao/ebooks)) 说明

## 项目由来

我 ([Fan Hongtao](https://github.com/fanhongtao)) 在[绵阳中学](http://www.scmyzx.com.cn)上高中时，使用的就是“甲种本”系列的教材。

入学时，老师就让大家想办法去买甲种本的书。还好时代相距不远，我爸爸在旧书摊淘到这些书目。

目前网上有人说，现行的教材被改得面目全非，知识不成体系，想要仅凭教材就很难学好。

现在的学生再想要买到当年的教材，难度可就太大了。网上虽然有扫描版本，但字迹不清楚，看着费眼。

结合我个人的经历，就萌生了将“甲种本”系列电子化的想法，供大家参考使用。**教材好与不好，请自行判断。**

此项目原本打算命名为 `jiazhongben`（“甲种本”的拼音），但创建时居然将拼音写错了，这才命名为 `ebooks`。

目前不仅包括了“甲种本”，还包含有其它书箱，只能说**天意如此**。

范洪滔 2020.08.03

## 高中课本

“甲种本”系列共十一本书。

### 我 ([Fan Hongtao](https://github.com/fanhongtao)) 录入的

| 序号 | 书名 | 进度 |
|:--:|:--|:--|
| 1 | 代数 第一册 | 完成 (2020-08-03 ~ 2020-10-20) |
| 2 | 代数 第二册 | 完成 (2020-10-21 ~ 2022-03-18)  |
| 3 | 代数 第三册 | 完成 (2022-03-19 ~ 2022-06-08) |
| 4 | 立体几何 全一册 | 完成 (2022-06-13 ~ 2025-04-22)  |

### 网友录入的

[james](https://github.com/jamesfang8499/) 完成了

* [物理 第一册](https://github.com/jamesfang8499/physics1)
* [物理 第二册](https://github.com/jamesfang8499/physics2)
* [物理 第三册](https://github.com/jamesfang8499/physics3)

[LaTeX 工作室](https://www.latexstudio.net/) 上，名叫 “海波” 用户的提供了：

* [平面解析几何 全一册](https://www.latexstudio.net/index/details/index/mid/2401.html)

[geezhu](https://github.com/geezhu/) 完成了：

* [《化学》（全三册甲种本）、物理（物理全两册乙种本）、《平面解析几何》以及《微积分初步》](https://github.com/geezhu/Category-A-Textbook)


## 初中课本

| 序号 | 书名 | 进度 |
|:--:|:--|:--|
| 1 | 初中物理 第一册 | 完成（2023-07-26 ~ 2023-08-17） |
| 2 | 初中物理 第二册 | 完成（2023-08-18 ~ 2023-09-09） |
| 3 | 初中代数 第一册 | 完成（2023-09-11 ~ 2023-11-05） |
| 4 | 初中代数 第二册 | 完成（2023-11-06 ~ 2024-04-20） |
| 5 | 初中代数 第三册 | 完成（2024-04-22 ~ 2024-06-07） |
| 6 | 初中代数 第四册 | 完成（2024-06-08 ~ 2024-08-06） |
| 7 | 初中化学 全一册 | 完成（2024-08-07 ~ 2024-10-10） |
| 8 | 初中几何 第一册 | 完成（2024-10-11 ~ 2024-12-28） |
| 9 | 初中几何 第二册 | 完成（2024-12-29 ~ 2025-02-24） |


## PDF下载

对于非 LaTeX 爱好者，直接通过 [Release](https://github.com/fanhongtao/ebooks/releases) 下载编译好的 PDF 文件。

没有必要去折腾 LaTeX。


## 其它

* 本项目依赖于 [TexLive](http://tug.org/texlive/) 2025，建议先从 [Acquiring TeX Live as an ISO image](http://tug.org/texlive/acquire-iso.html) 下载 ISO 文件，再进行安装。
* 需要先将各书本目录的 `pic-pdf` 子目录下的 `tex` 文件编译成 `pdf` 文件，才能编译书本。
* 由俄罗斯的**特别军事行动**所引发的一系列后果，推测 GitHub 在某天不能访问会是大概率事件。所以启用 [备用库](https://gitee.com/fhtao/ebooks)


## 完结说明

初中、高中的课本都有了，本项目至此结束，**后继不再更新维护**。

