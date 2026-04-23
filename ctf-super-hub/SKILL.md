---
name: "CTF•超级总控"
description: "面向 CTF 新手与综合题的统一总控 skill，用于自动选择最合适的 ctf-* skill、先头脑风暴再路由、手动指定并校验题型、在教学/比赛/只提示三种输出模式间切换、跨类别 pivot，并在解题完成后衔接题解写作;触发名:ctf-super-hub"
---

# CTF 超级总控

## 概览

当用户不想先自己判断该用哪个 skill 时，把它当作 CTF 工作流的**最高层控制入口**。

同时优先兼顾三件事：
- 上手门槛低
- 路由尽量准确
- 输出对新手友好、可读

## 核心模型

把每次会话拆成两个独立决策：

1. **路由模式**
   - `auto`：先检查材料，再自动选最可能的 skill
   - `brainstorm`：先澄清题目，再自动路由或手动路由
   - `manual`：接受用户指定的类别，但仍做基本合理性检查

2. **输出风格**
   - `teaching`：用直白语言解释判断过程与术语
   - `competition`：更短、更快、以推进解题为主
   - `hints-only`：只给方向性提示，不把完整解法一次性展开

如果用户没有指定：
- 已有文件、URL、服务、源码或二进制时，用 `auto + teaching`
- 只有模糊描述、或者用户明显很迷茫时，用 `brainstorm + teaching`
- 只有当用户明确点名类别时，才默认用 `manual + teaching`

## 主流程

按下面顺序执行。

1. **Collect the minimum useful input**
   - challenge text
   - filenames or file types
   - URL / IP / port / protocol
   - what the user already tried
   - whether the user wants speed or learning

2. **Choose routing mode**
   - If artifacts exist, prefer `auto`
   - If the user says “看不懂 / 不会分类 / 不知道第一步”, prefer `brainstorm`
   - If the user says “这题应该是 reverse 吧”, use `manual` with a sanity check

3. **Choose delivery style**
   - Default to `teaching`
   - If the user sounds time-pressed, switch to `competition`
   - If the user explicitly asks for nudges, switch to `hints-only`

4. **Run lightweight triage**
   - Use filenames, file headers, service behavior, challenge wording, and obvious artifacts
   - Avoid deep analysis before a category decision unless the category depends on it

5. **Report category confidence**
   - give a primary skill
   - give a secondary skill when relevant
   - state the strongest evidence
   - state the missing evidence when confidence is not high

6. **Route to the right specialist skill**
   - `ctf-web`
   - `ctf-crypto`
   - `ctf-reverse`
   - `ctf-pwn`
   - `ctf-forensics`
   - `ctf-osint`
   - `ctf-malware`
   - `ctf-misc`
   - `ctf-ai-ml`
   - `ctf-writeup` when the solve is done

7. **Give only the next 1-3 actions**
   - Never dump a giant wall of commands on a beginner by default
   - Explain what each action is for
   - Add the next branch if the first attempt fails

8. **Pivot when the first classification looks wrong**
   - Switch skill deliberately and explain why
   - Keep the previous skill as supporting context when useful

9. **Close the loop**
   - When the flag is found or the solve path is clear, recommend `ctf-writeup`

## 路由规则

Use the detailed tables in `references/routing-table.md` and `references/pivot-patterns.md` when the classification is not obvious.

High-confidence defaults:
- HTTP app, login form, upload flow, API, tokens -> `ctf-web`
- ELF / EXE / APK / WASM / firmware, goal is logic recovery -> `ctf-reverse`
- Binary service, memory corruption, control-flow hijack -> `ctf-pwn`
- RSA / AES / modular arithmetic / weird random output -> `ctf-crypto`
- PCAP / memory dump / disk image / stego media -> `ctf-forensics`
- public identity / geolocation / DNS / public footprint -> `ctf-osint`
- packed sample / C2 / beacon / malicious script -> `ctf-malware`
- pyjail / bash jail / encoding / game / weird constraints -> `ctf-misc`
- prompt injection / model extraction / adversarial example / jailbreak -> `ctf-ai-ml`

If confidence is medium or low, do not bluff. Present:
- primary candidate
- backup candidate
- the smallest next step that will disambiguate them

## 先头脑风暴的行为规则

When using `brainstorm` mode:
- do not jump straight into exploitation
- first clarify what the challenge gives, what the goal probably is, and what is missing
- ask at most one high-value clarifying question at a time when a question is truly necessary
- once the picture is clear enough, move to `auto` or `manual`

Use `references/brainstorm-playbook.md` and `references/prompt-library.md` for ready-made patterns.

## 手动指定路由的行为规则

When the user chooses a category manually:
- accept the choice as the current working hypothesis
- briefly sanity-check it
- if it looks wrong, explain the mismatch in one short block
- propose the better category without sounding obstructive

## 输出风格规则

### Teaching style
- explain the category choice in plain language
- define unfamiliar terms in one sentence
- prefer fewer steps with more explanation
- use the standard beginner output from `references/output-contract.md`

### Competition style
- keep the output short and operational
- skip long explanations unless they affect the next action
- still show category confidence and pivot conditions

### Hints-only style
- give nudges, not full solution dumps
- suggest what to inspect next and why
- avoid over-solving unless the user asks for a full path

## 跨技能组合模式

Some challenges need two skills. Common pairings:
- `ctf-web` + `ctf-crypto` for JWTs, signatures, custom MACs
- `ctf-web` + `ctf-reverse` for WASM or obfuscated client logic
- `ctf-reverse` + `ctf-pwn` for binary analysis before exploitation
- `ctf-forensics` + `ctf-crypto` for encrypted captures or recovered blobs
- `ctf-malware` + `ctf-forensics` for traffic plus sample analysis
- `ctf-misc` + `ctf-crypto` for constrained or jail-style crypto tasks

Use `references/pivot-patterns.md` for the full map.

## 默认输出契约

Unless the user asks for a different format, structure the answer as:

1. **Current read**
2. **Why this route**
3. **Next 1-3 steps**
4. **What each step is doing**
5. **What to try if it fails**
6. **Tiny glossary**

Use the exact guidance in `references/output-contract.md`.

## 按需加载的参考文件

- `references/mode-playbook.md`: exact behavior for auto / brainstorm / manual and delivery styles
- `references/routing-table.md`: category mapping by artifacts, keywords, and service behavior
- `references/pivot-patterns.md`: when two skills should be combined
- `references/output-contract.md`: beginner-friendly response structure
- `references/prompt-library.md`: copy-paste prompts for users and ready-made first replies
- `references/first-five-minutes.md`: low-friction opening actions by category
- `references/examples.md`: example sessions

## 结束条件

保持总控状态，直到满足以下任一条件：
- 已经明确选出正确的专项 skill
- 已经定义好下一步最关键的验证动作
- 题目已解出，并准备转入 `ctf-writeup`
