#!/usr/bin/env python3
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parent.parent
ALLOWED_FRONTMATTER_KEYS = {
    'name', 'description', 'license', 'compatibility', 'allowed-tools', 'metadata', 'argument-hint'
}
REQUIRED_REPO_FILES = [
    'README.md',
    'START-HERE.md',
    'SKILL-INDEX.md',
    'LICENSE',
    'THIRD_PARTY_NOTICES.md',
    'CONTRIBUTING.md',
    'SECURITY.md',
    'CODE_OF_CONDUCT.md',
    '.gitignore',
    '.gitattributes',
    'install-to-codex.sh',
    'scripts/install_ctf_tools.sh',
]


def parse_frontmatter(text):
    m = re.match(r'^---\n(.*?)\n---\n', text, re.S)
    if not m:
        return None
    block = m.group(1)
    lines = block.splitlines()
    keys = []
    values = {}
    current_key = None
    for line in lines:
        if re.match(r'^[A-Za-z0-9_-]+:\s*', line):
            key, value = line.split(':', 1)
            key = key.strip()
            value = value.strip().strip('"')
            keys.append(key)
            values[key] = value
            current_key = key
        elif line.startswith('  ') and current_key == 'metadata':
            continue
    return keys, values


def check_repo_files():
    missing = [f for f in REQUIRED_REPO_FILES if not (ROOT / f).exists()]
    return missing


def check_skills():
    errors = []
    warnings = []
    skill_dirs = [p for p in ROOT.iterdir() if p.is_dir() and (p / 'SKILL.md').exists()]
    for skill in sorted(skill_dirs):
        text = (skill / 'SKILL.md').read_text(encoding='utf-8', errors='ignore')
        parsed = parse_frontmatter(text)
        if not parsed:
            errors.append(f'{skill.name}: SKILL.md 缺少有效 frontmatter')
            continue
        keys, values = parsed
        for key in keys:
            if key not in ALLOWED_FRONTMATTER_KEYS:
                warnings.append(f'{skill.name}: frontmatter 包含扩展字段 {key}（已允许保留上游兼容性时人工确认）')
        if 'name' not in values or not values['name']:
            errors.append(f'{skill.name}: 缺少 name')
        if 'description' not in values or not values['description']:
            errors.append(f'{skill.name}: 缺少 description')
        desc = values.get('description', '')
        if '触发名:' not in desc:
            warnings.append(f'{skill.name}: description 中未显式包含触发名')
        if skill.name == 'ctf-super-hub':
            refs = [
                'references/mode-playbook.md',
                'references/routing-table.md',
                'references/pivot-patterns.md',
                'references/output-contract.md',
                'references/prompt-library.md',
                'references/first-five-minutes.md',
                'references/examples.md',
            ]
            for ref in refs:
                if not (skill / ref.replace('references/', 'references/')).exists():
                    errors.append(f'ctf-super-hub: 缺少 {ref}')
    return errors, warnings


def main():
    missing = check_repo_files()
    errors, warnings = check_skills()

    if missing:
        print('缺少仓库级文件：')
        for m in missing:
            print(f'  - {m}')
    if warnings:
        print('警告：')
        for w in warnings:
            print(f'  - {w}')
    if errors:
        print('错误：')
        for e in errors:
            print(f'  - {e}')
        sys.exit(1)
    if missing:
        sys.exit(1)
    print('校验通过：仓库结构与关键 skill 文件基本完整。')


if __name__ == '__main__':
    main()
