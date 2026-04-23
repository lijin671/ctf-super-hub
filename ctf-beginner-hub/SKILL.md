---
name: "CTF•新手入口"
description: "面向 CTF 与逆向新手的统一入口，用于在自动分流与先头脑风暴再选 skill 之间切换，适合不知道该用哪个 ctf-* skill、想先理清题意、或想边做边学的场景;触发名:ctf-beginner-hub"
argument-hint: "[auto|brainstorm|manual] [challenge-file-or-url-or-description]"
metadata:
  user-invocable: "true"
---

# CTF Beginner Hub

这是给 **不会选 skill 的新手** 用的统一入口。

## 什么时候用

出现下面任一情况就用这个 skill：

- 你拿到一道题，但不知道它属于哪一类
- 你知道题面内容，但不知道第一步怎么下手
- 你想先把思路讲清楚，再开始自动分流
- 你希望回答更像“带学”，而不是直接甩术语

## 两种模式

### 模式 1：自动分流（默认推荐）

适合：
- 已经有题目附件、URL、IP、端口、源码、二进制
- 想快点进入正确 skill
- 不想自己判断分类

流程：
1. 收集输入：题面、附件、URL、服务、已知线索
2. 做轻量 triage：文件类型、服务类型、题面关键词
3. 给出主分类 + 备选分类 + 判断理由
4. 高置信度时直接转到对应 `ctf-*` skill
5. 低置信度时让用户在“继续自动 / 手动选 / 先头脑风暴”之间选

自动分流优先使用：`solve-challenge`

### 模式 2：先头脑风暴，再分流

适合：
- 题目描述抽象，看不懂想干什么
- 想先把目标、限制、已有进度讲清楚
- 想先学习“为什么这么判断”，再选 skill

流程：
1. 用 `brainstorming` 风格先澄清：题目给了什么、做过什么、卡在哪里、想快做还是带学
2. 头脑风暴结束后，进入：
   - **自动选**：继续交给 `solve-challenge`
   - **手动选**：从分类表中人工挑选 skill

## 手动分类表

- `ctf-web`：XSS、SQLi、SSTI、SSRF、JWT、上传、鉴权、原型污染
- `ctf-crypto`：RSA、AES、ECC、PRNG、签名、哈希、数学构造
- `ctf-reverse`：ELF、EXE、APK、WASM、固件、自定义 VM、混淆代码
- `ctf-pwn`：溢出、ROP、fmt、heap、沙箱逃逸、内核利用
- `ctf-forensics`：PCAP、内存、磁盘、注册表、隐写、音频、日志
- `ctf-osint`：社交媒体、地理定位、公开资料、DNS、用户名追踪
- `ctf-malware`：恶意样本、C2、流量协议、脚本混淆、PE/.NET
- `ctf-misc`：pyjail、bash jail、编码、约束、游戏、RF/SDR、杂项
- `ctf-ai-ml`：prompt injection、模型提取、对抗样本、训练投毒、LLM 题
- `ctf-writeup`：题做完以后整理标准 writeup

## 新手友好输出规范

统一尽量按这个结构输出：

1. 这题现在看起来像什么
2. 为什么选这个 skill
3. 现在先做的 1~3 步
4. 每一步命令是干什么的
5. 如果失败，下一条分支是什么
6. 术语用一句人话解释

## 推荐默认策略

如果用户没有指定模式：
- **已有附件 / URL / 服务** -> 先走“自动分流”
- **只有模糊题面 / 明显很迷茫** -> 先走“头脑风暴”

## 需要时再读的参考文件

- 快速选择模式：`references/router-cheatsheet.md`
- 可直接复制使用的话术：`references/copy-paste-prompts.md`
- 统一输出格式：`references/output-template.md`
- 给新手的使用例子：`references/examples.md`

## 结束条件

当主 skill 被确定后：
- 进入对应 `ctf-*` skill 深挖
- 如果题目跨领域，可同时参考第二技能
- 题做完后转 `ctf-writeup`
