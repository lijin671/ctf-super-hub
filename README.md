<div align="center">

<p>
  <img src="./assets/banner.svg" alt="CTF Super Hub Banner" width="100%" />
</p>

# CTF Super Hub / CTF Skills 中文整合包

**给中文用户的 CTF / 逆向 Skills 统一入口**  
不会选 skill、不会判断题型、也不知道第一步做什么？先让它帮你分流，再决定怎么做。

<p>
  <a href="./START-HERE.md">快速开始</a> ·
  <a href="./SKILL-INDEX.md">技能索引</a> ·
  <a href="./docs/USAGE.md">使用说明</a> ·
  <a href="./docs/LINUXDO.md">LinuxDo 社区</a> ·
  <a href="#目录导航">目录导航</a>
</p>

<p>
  <img alt="license" src="https://img.shields.io/github/license/asdfgh1445/ctf-super-hub">
  <img alt="stars" src="https://img.shields.io/github/stars/asdfgh1445/ctf-super-hub?style=social">
  <img alt="forks" src="https://img.shields.io/github/forks/asdfgh1445/ctf-super-hub?style=social">
  <img alt="last commit" src="https://img.shields.io/github/last-commit/asdfgh1445/ctf-super-hub">
</p>

</div>

---

## 目录导航

- [这是什么](#这是什么)
- [核心入口](#核心入口)
- [适合谁](#适合谁)
- [包含哪些 skill](#包含哪些-skill)
- [快速开始](#快速开始)
- [安装](#安装)
- [工具检查](#工具检查)
- [仓库结构](#仓库结构)
- [文档导航](#文档导航)
- [校验](#校验)
- [加入社区 · 共建生态](#-加入社区--共建生态)

---

## 这是什么

大多数 CTF skill 仓库的问题，不是内容不够，而是 **新手根本不知道先用哪个**。

这个仓库做的不是继续堆 skill，而是把一组已经能打的 CTF / 逆向 skill，整理成一个真正能上手、能发布、也能持续迭代的中文入口。

你真正会用到的是这三件事：

1. **一个入口**：优先用 `ctf-super-hub` 自动判断题型、路由 skill  
2. **两种起手方式**：直接自动分流，或者先头脑风暴再决定  
3. **三种输出模式**：教学 / 比赛 / 只提示  

目标不是让你“看懂这个仓库”，而是让你 **真的开始做题**。

---

## 核心入口

### `ctf-super-hub`（默认推荐）

如果你只记住一个名字，记 `ctf-super-hub` 就够了。

它负责先判断，再分流，再根据你的状态切换表达方式。

它能做的事：
- 自动判断更像 `web / crypto / reverse / pwn / forensics / ...` 哪一类题
- 信息不足时，先帮你做最小化头脑风暴
- 你手动指定类别时，也会做 sanity check
- 在 `teaching / competition / hints-only` 三种模式之间切换
- 题做完后，衔接到 `ctf-writeup`

### 其他入口

| 入口 | 适合场景 | 说明 |
|---|---|---|
| `ctf-super-hub` | **默认首选** | 超级总控：自动分流 / 头脑风暴 / 手动指定 / 教学 / 比赛 / 只提示 |
| `ctf-beginner-hub` | 更轻量的新手入口 | 自动分流 / 先头脑风暴再选 |
| `solve-challenge` | 已经明确要先做 triage | 更偏挑战分类与路由 |
| `brainstorming` | 题意模糊、想先理清思路 | 先澄清目标、约束、线索 |
| `ctf-web` 等专项 skill | 已确定题型 | 直接进入专项处理 |

---

## 适合谁

如果你属于下面任意一种，这个仓库就适合你：

- 你会做题，但不想每次先花时间找入口
- 你刚开始学 CTF，不知道第一步做什么
- 你想给中文用户整理一套真正能直接用的 skill 包
- 你想把本地 skill 系统做成一个可公开维护的项目

---

## 包含哪些 skill

### 统一入口
- `ctf-super-hub`
- `ctf-beginner-hub`
- `solve-challenge`
- `brainstorming`

### 专项 skill
- `ctf-web`
- `ctf-crypto`
- `ctf-reverse`
- `ctf-pwn`
- `ctf-forensics`
- `ctf-osint`
- `ctf-malware`
- `ctf-misc`
- `ctf-ai-ml`
- `ctf-writeup`

完整索引见：[`SKILL-INDEX.md`](./SKILL-INDEX.md)

---

## 快速开始

最好的理解方式不是继续往下看，而是直接拿一道题试。下面这些用法里，前两种最常用。

### 1) 默认推荐：自动分流 + 教学模式

> 这一步里如果题目明显进入 Web / 接口 / 漏洞验证阶段，总控会自动把 Strix 当作增强层接进去，你不需要先自己判断。


```text
请使用 ctf-super-hub 帮我处理这道题。
如果你能判断题型，就自动分流到最合适的 ctf-* skill。
如果信息还不够，就先带我做最小化头脑风暴。
默认用 teaching 风格输出。

题目信息：
[粘贴题面/附件/URL/IP:PORT/源码结构/已做尝试]
```

### 2) 比赛模式

```text
请使用 ctf-super-hub 的 auto + competition 模式。
先判断最像哪类题，再只告诉我接下来最该做的 1~3 步。
```

### 3) 只提示模式

```text
请使用 ctf-super-hub 的 auto + hints-only 模式。
不要直接把解法全展开，只告诉我下一步该查什么、为什么。
```

### 4) 先头脑风暴

```text
请使用 ctf-super-hub 的 brainstorm + teaching 模式。
我现在看不懂这题是什么类型。
先帮我梳理目标、线索、缺失信息，再决定自动路由还是手动路由。
```

## 安装

### 安装到默认 Codex 技能目录

```bash
./install-to-codex.sh
```

### 安装到自定义目录

```bash
./install-to-codex.sh /path/to/skills-dir
```

---

## 工具检查

仓库附带一个轻量工具检查脚本：

```bash
bash scripts/install_ctf_tools.sh check
```

它会帮助你：
- 检查基础工具是否存在
- 提示常见 reverse / forensics / web 工具是否缺失
- 给出常见 Python 依赖建议

---

## 仓库结构

```text
.
├── README.md
├── START-HERE.md
├── SKILL-INDEX.md
├── install-to-codex.sh
├── scripts/
│   ├── install_ctf_tools.sh
│   └── validate_skills.py
├── docs/
│   ├── USAGE.md
│   ├── PUBLISHING.md
│   ├── LOCALIZATION.md
│   └── LINUXDO.md
├── .github/
│   ├── ISSUE_TEMPLATE/
│   ├── pull_request_template.md
│   └── workflows/
├── ctf-super-hub/
├── ctf-beginner-hub/
├── solve-challenge/
├── brainstorming/
└── ctf-*/
```

---

## 文档导航

- [`START-HERE.md`](./START-HERE.md)：最快上手
- [`SKILL-INDEX.md`](./SKILL-INDEX.md)：技能索引
- [`docs/USAGE.md`](./docs/USAGE.md)：使用说明
- [`docs/LINUXDO.md`](./docs/LINUXDO.md)：LinuxDo 发帖与中文社区建议
- [`docs/PUBLISHING.md`](./docs/PUBLISHING.md)：GitHub 发布前检查清单
- [`docs/LOCALIZATION.md`](./docs/LOCALIZATION.md)：汉化策略与约定

---

## 校验

运行：

```bash
python3 scripts/validate_skills.py
```

这个脚本会检查：
- 关键仓库文件是否存在
- 主要 skill 是否有 frontmatter
- `ctf-super-hub` 的关键参考文件是否完整

同时仓库还带了 GitHub Actions：
- `.github/workflows/validate.yml`

---

### 🤝 加入社区 · 共建生态

如果你认同这件事，欢迎一起把它做成中文用户真正会用的 CTF skill 底座——包括原来的 CTF 主流程，以及 Web/接口题所需的增强能力。

你可以用下面几种方式参与：

- 在 **GitHub** 提 issue / PR：补规则、补文档、补用例、补 skill
- 在 **LinuxDo** 反馈体验：告诉我哪类题最卡、哪里最难用、哪里最值得继续打磨
- 把你的真实使用场景丢过来：我们优先优化最常见、最刚需的那一部分

<p align="center">
  <a href="https://github.com/asdfgh1445/ctf-super-hub">
    <img src="https://img.shields.io/badge/GitHub-ctf--super--hub-181717?style=for-the-badge&logo=github" alt="GitHub" />
  </a>
  &nbsp;
  <a href="https://linux.do">
    <img src="https://img.shields.io/badge/社区-LinuxDo-3B82F6?style=for-the-badge" alt="LinuxDo" />
  </a>
</p>

<p align="center">
  <sub>LinuxDo 发布帖：待补充</sub>
</p>

<p align="center">
  <i>这个项目最有价值的，不是“再多一个仓库”，而是把中文用户最容易卡住的第一步，做成一个可复用、可协作、可持续迭代的系统。</i>
</p>
