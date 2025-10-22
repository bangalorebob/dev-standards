# Context Preservation Guide

## Problem
AI assistant context is lost when switching between repositories or restarting VS Code sessions, leading to loss of valuable insights and solutions.

## Solutions

### 1. Document Key Insights
Create these files in each project:
- `AI_CONTEXT.md` - Key decisions and solutions from AI conversations
- `TECHNICAL_DEBT.md` - Known issues and planned improvements
- `LEARNINGS.md` - Patterns and insights discovered

### 2. Use Multi-Root Workspaces
Keep related repositories open simultaneously using `.code-workspace` files.

### 3. Cross-Reference Solutions
Link related solutions between repositories in documentation.

### 4. Template for AI Context Files

```markdown
# AI Assistant Context

## Last Updated
[Date]

## Key Solutions Implemented
- [Solution 1]: [Brief description and file references]
- [Solution 2]: [Brief description and file references]

## Ongoing Issues
- [Issue 1]: [Description and current status]
- [Issue 2]: [Description and current status]

## Architecture Decisions
- [Decision 1]: [Rationale and impact]
- [Decision 2]: [Rationale and impact]

## Related Repositories
- [repo-name]: [relationship and shared solutions]
```

## Best Practices
1. Update context files at the end of each significant AI session
2. Reference specific files and line numbers when documenting solutions
3. Use consistent naming conventions across projects
4. Create links between related issues in different repositories