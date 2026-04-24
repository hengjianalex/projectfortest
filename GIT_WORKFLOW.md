#!/bin/bash

# AI Agent Git 工作流指南
# 此文件说明如何让 AI Agent 自动化处理 Git 操作

## 快速开始

### 1. 自动提交代码修改
```bash
# 简单提交（自动检测类型）
./scripts/git-auto-commit.sh

# 带自定义消息提交
./scripts/git-auto-commit.sh "feat: 添加了新功能"
```

### 2. 创建功能分支
```bash
# 自动生成分支名
./scripts/git-create-branch.sh

# 指定分支名
./scripts/git-create-branch.sh "feature/user-auth"
```

### 3. 标准 Git 工作流（AI Agent 推荐）

#### 修改代码前：
```bash
# 创建新的功能分支
git checkout -b feature/your-feature-name
```

#### 修改代码后：
```bash
# 查看变更
git status

# 添加变更
git add .

# 提交（使用语义化提交格式）
git commit -m "type: description"

# 推送
git push origin feature/your-feature-name
```

## 语义化提交格式（Conventional Commits）

- `feat`: 新功能
- `fix`: 修复 bug
- `docs`: 文档更新
- `style`: 代码格式（不影响代码运行）
- `refactor`: 重构（即不是新功能，也不是 bug 修复）
- `test`: 添加或修改测试
- `chore`: 构建过程或辅助工具变动

### 示例：
```bash
git commit -m "feat: 添加用户登录功能"
git commit -m "fix: 修复登录页面的验证错误"
git commit -m "docs: 更新 API 文档"
git commit -m "refactor: 优化数据库查询逻辑"
git commit -m "chore: 更新依赖版本"
```

## AI Agent 自动化示例

当 AI Agent 修改代码后，自动执行以下操作：

1. 检测文件变更
2. 根据变更内容生成合适的提交消息
3. 提交到当前分支
4. 推送到 GitHub

## 分支策略

- `main`: 主分支，保护分支，只接受来自 feature 分支的合并
- `feature/*`: 功能分支，AI Agent 在此分支上开发
- `hotfix/*`: 紧急修复分支
- `release/*`: 发布分支

## 查看状态

```bash
# 查看当前状态
git status

# 查看提交历史
git log --oneline

# 查看远程仓库
git remote -v

# 查看分支
git branch -a
```

## 实用命令

```bash
# 拉取最新代码
git pull origin main

# 合并分支
git merge feature/branch-name

# 创建标签
git tag v1.0.0
git push origin v1.0.0

# 查看变更
git diff
```
