#!/bin/bash

# Git 工作流自动化脚本
# 为 AI Agent 创建功能分支并提交代码

# 检查是否提供了分支名称
if [ -z "$1" ]; then
    # 自动生成基于时间戳的分支名
    branch_name="feature/auto-$(date +%Y%m%d-%H%M%S)"
else
    branch_name="$1"
fi

echo "📋 创建功能分支：$branch_name"

# 创建并切换到新分支
git checkout -b "$branch_name"

# 等待用户/AI 进行代码修改
echo "✅ 分支已创建，现在可以进行代码修改"
echo "修改完成后，请运行以下命令提交:"
echo "  git add ."
echo "  git commit -m 'feat: 你的提交消息'"
echo "  git push origin $branch_name"
echo ""
echo "或者使用自动提交脚本:"
echo "  ./scripts/git-auto-commit.sh '你的提交消息'"
