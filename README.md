<div align="center">

<p>
  <img src="./assets/banner.svg" alt="CTF Super Hub Banner" width="100%" />
</p>

# CTF Super Hub / CTF Skills 中文整合包

**面向中文用户的 CTF / 逆向 Skills 整合发布页**  
让新手先开始，再学会分类；让老手直接路由、切模式、写题解。

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
- [LinuxDo 社区（中文用户）](#linuxdo-社区中文用户)
- [安装](#安装)
- [工具检查](#工具检查)
- [仓库结构](#仓库结构)
- [文档导航](#文档导航)
- [校验](#校验)

---

## 这是什么

这不是一堆零散 CTF skill 的简单搬运。

这是一个围绕 **中文用户使用体验** 重新整理过的技能整合包，重点解决三个问题：

1. **不会选 skill** → 给你统一入口自动分流  
2. **不会开始做题** → 给你教学式输出，不先砸一屏术语  
3. **想公开发布** → 补齐 README、License、第三方说明、CI、模板与安装脚本  

你可以把它理解成：

> **一套既能给新手直接上手，又能作为 GitHub 开源项目发布的 CTF 中文技能整合包。**

---

## 核心入口

### `ctf-super-hub`（默认推荐）

这是整个仓库的主入口。

它负责：
- 自动选择最合适的 `ctf-*` skill
- 信息不足时先头脑风暴
- 支持手动指定题型并做 sanity check
- 在三种输出风格中切换：
  - `teaching`
  - `competition`
  - `hints-only`
- 支持跨类别 pivot
- 解题后转入 `ctf-writeup`

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

这个仓库适合：

- 想用 Codex / 类 Codex 做 CTF 的中文用户
- 想给新手准备一套“能直接开始”的 CTF 技能包的人
- 想把 reverse / web / crypto / pwn / forensics 等能力统一发布的人
- 想把本地 skill 整理成一个真正像开源项目的仓库的人

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

### 1) 默认推荐：自动分流 + 教学模式

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

---

## LinuxDo 社区（中文用户）

既然目标用户是中文用户，这里保留一个统一的 LinuxDo 社区入口。

### 建议发帖方向

| 场景 | 推荐板块方向 | 适合发什么 |
|---|---|---|
| 项目发布 / 更新 | **开发调优** | 仓库介绍、版本更新、设计思路、功能演示 |
| 工具分享 / 资源整理 | **资源荟萃** | CTF skill 包、脚本、模板、安装方法、使用示例 |

### 链接

- LinuxDo 发布帖：待补充
- LinuxDo 社区：<https://linux.do>

更完整说明见：[`docs/LINUXDO.md`](./docs/LINUXDO.md)

---

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
