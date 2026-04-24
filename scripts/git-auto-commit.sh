#!/bin/bash

# Git 自动化提交脚本
# 用于 AI Agent 自动处理代码修改后的版本管理

# 获取变更文件列表
changed_files=$(git diff --name-only HEAD)

if [ -z "$changed_files" ]; then
    echo "没有检测到文件变更"
    exit 0
fi

# 自动检测提交类型
commit_type="chore"
commit_message=""

# 根据修改的文件类型自动判断提交类型
if echo "$changed_files" | grep -qE '\.(py|js|ts|jsx|tsx|java|go|rs)$'; then
    if echo "$changed_files" | grep -qiE '(test|spec)'; then
        commit_type="test"
        commit_message="添加或更新测试"
    elif echo "$changed_files" | grep -qiE '(fix|bug|error)'; then
        commit_type="fix"
        commit_message="修复问题"
    else
        commit_type="feat"
        commit_message="新功能或改进"
    fi
elif echo "$changed_files" | grep -qE '\.(md|txt|rst)$'; then
    commit_type="docs"
    commit_message="文档更新"
elif echo "$changed_files" | grep -qE '\.(json|yaml|yml|toml|env)$'; then
    commit_type="chore"
    commit_message="配置文件更新"
elif echo "$changed_files" | grep -qE '\.(css|scss|less|html)$'; then
    commit_type="style"
    commit_message="样式更新"
fi

# 使用传入的提交消息（如果有）
if [ -n "$1" ]; then
    commit_message="$1"
fi

# 添加所有变更
git add .

# 提交变更
git commit -m "${commit_type}: ${commit_message}"

# 推送到远程
git push origin main

echo "✅ 提交成功：${commit_type}: ${commit_message}"
echo "变更文件:"
echo "$changed_files"
