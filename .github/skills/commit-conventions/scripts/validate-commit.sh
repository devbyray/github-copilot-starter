#!/bin/bash
# Validates commit message format according to Conventional Commits

commit_msg_file=$1
commit_msg=$(cat "$commit_msg_file")

# Conventional Commits pattern
pattern="^(feat|fix|docs|style|refactor|test|chore|perf|ci|build)(\([a-z0-9-]+\))?: .{1,72}$"

if ! echo "$commit_msg" | grep -qE "$pattern"; then
    echo "❌ Invalid commit message format!"
    echo ""
    echo "Expected format: <type>[scope]: <description>"
    echo ""
    echo "Examples:"
    echo "  feat(auth): add login feature"
    echo "  fix(api): resolve data fetching error"
    echo "  docs(readme): update installation steps"
    echo ""
    echo "Your message: $commit_msg"
    exit 1
fi

echo "✅ Commit message format is valid"
exit 0
