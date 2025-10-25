# The Complete Guide to Using Cursor Effectively

## Table of Contents

1. [What is Cursor?](#what-is-cursor)
2. [Getting Started](#getting-started)
3. [Core Features](#core-features)
4. [Best Practices](#best-practices)
5. [Advanced Techniques](#advanced-techniques)
6. [Common Pitfalls to Avoid](#common-pitfalls-to-avoid)
7. [Real-World Workflows](#real-world-workflows)
8. [Tips for Professional Development](#tips-for-professional-development)

---

## What is Cursor?

Cursor is an AI-powered code editor built on VS Code that integrates AI assistance directly into your development workflow. Think of it as VS Code with a built-in AI pair programmer.

### Key Differences from ChatGPT/Copilot

- **Full codebase awareness**: Cursor can see your entire project structure
- **Multi-file editing**: Can edit multiple files at once based on context
- **Terminal integration**: Can run commands and see terminal output
- **Context retention**: Remembers your project structure and previous conversations
- **Native IDE features**: All VS Code extensions and features work

---

## Getting Started

### Installation

1. Download Cursor from https://cursor.sh
2. Install like any other application
3. Sign in with your account
4. Import your VS Code settings (optional)

### Initial Setup

**Enable AI Features:**

- Go to Settings (Cmd/Ctrl + ,)
- Search for "AI"
- Enable "Cursor Tab" for inline suggestions
- Enable "AI Chat" for the chat interface

**Configure Models:**

- Cursor Chat uses Claude Sonnet 3.5 by default (recommended)
- You can switch models in settings if needed

**Set Up .cursorrules (Optional but Recommended):**

Create a `.cursorrules` file in your project root to guide Cursor's behavior for that specific project.

---

## Core Features

### 1. Cursor Chat (Cmd/Ctrl + L)

The main AI chat interface - your AI pair programmer.

**What it can do:**

- Answer questions about your code
- Generate new code based on requirements
- Refactor existing code
- Debug issues
- Explain complex logic
- Write tests
- Review code for issues

**How to use it:**

```
// Good: Be specific with context
"In the UserController, refactor the create action to use a service object. 
The service should handle user creation and send a welcome email."

// Bad: Too vague
"Fix my code"
```

### 2. Cursor Tab (Inline Suggestions)

AI-powered autocomplete on steroids.

**When it activates:**

- As you type code
- When you pause while coding
- After comments describing what you want to do

**How to accept:**

- Press `Tab` to accept the suggestion
- Press `Esc` to dismiss
- Keep typing to ignore and continue

**Pro tip:** Write a comment describing what you want, press Enter, and Cursor will often generate the implementation.

```javascript
// Calculate the compound interest for a given principal, rate, and time
// [Press Enter and Tab will suggest the function]
```

### 3. Cmd/Ctrl + K (Quick Edit)

Inline editing for the current file or selection.

**Use cases:**

- Quick refactors
- Rename variables across a function
- Add error handling to existing code
- Convert code style (e.g., function → arrow function)

**Example:**

1. Select a block of code
2. Press Cmd/Ctrl + K
3. Type: "Add error handling for null values"
4. Cursor will edit the selection in place

### 4. @ Mentions (Context Control)

Reference specific files, folders, docs, or code in your prompts.

**Available mentions:**

- `@Files` - Reference specific files
- `@Folder` - Reference entire folders
- `@Code` - Reference specific code symbols
- `@Docs` - Reference documentation (MDN, React docs, etc.)
- `@Web` - Search the web for current information
- `@Git` - Reference git diffs or commits

**Examples:**

```
"@Files:user.rb Look at this model and suggest validation improvements"

"@Folder:controllers Review all controllers for consistent error handling"

"@Docs react hooks Explain useEffect with cleanup"

"@Web latest Next.js 14 features"
```

### 5. Codebase Indexing

Cursor indexes your entire codebase for better context.

**What this enables:**

- Answers questions about any file in your project
- Finds relevant code across multiple files
- Understands your project architecture
- Makes connections between related code

**Example:**

```
"Where in my codebase do we handle authentication?"
// Cursor will search and show relevant files
```

---

## Best Practices

### 1. Provide Clear Context

**Do:**

```
"I'm building a Rails API for user authentication. I need a User model with:
- email and password fields
- email validation
- secure password hashing with bcrypt
- a method to generate JWT tokens

Here's my current schema: [paste schema if relevant]"
```

**Don't:**

```
"make a user model"
```

### 2. Iterate and Refine

Don't expect perfection on the first try. Cursor works best with iteration.

**Workflow:**

1. Get initial implementation
2. Review it critically
3. Ask for improvements: "This works but could you refactor for better readability?"
4. Request specific changes: "Use a guard clause instead of nested if statements"

### 3. Use @ Mentions Strategically

**When working on existing code:**

```
"@Files:user_controller.rb @Files:user_service.rb 
Refactor the create action to use the service pattern consistently"
```

**When learning:**

```
"@Docs typescript generics Explain how to type this function properly"
```

### 4. Break Down Complex Tasks

**Instead of:**

```
"Build a complete e-commerce checkout system"
```

**Do:**

```
1. "Design the database schema for orders and line items"
2. "Generate the Order model with validations"
3. "Create the checkout service with payment processing"
4. "Add error handling for failed payments"
```

### 5. Review Everything

**Critical rule:** ALWAYS review AI-generated code before accepting it.

- Does it match your requirements?
- Are there edge cases it missed?
- Does it follow your project's conventions?
- Are there security concerns?
- Does it handle errors properly?

### 6. Use .cursorrules Files

Create a `.cursorrules` file in your project root to set guidelines:

```markdown
# My Project Guidelines

- Use TypeScript strict mode
- Prefer functional components in React
- Use Tailwind for styling
- Write tests for all business logic
- Follow REST conventions for APIs
- Use async/await over .then() chains
```

Cursor will reference this file when generating code for your project.

---

## Advanced Techniques

### 1. Multi-File Operations

Cursor can edit multiple files at once.

**Example:**

```
"I'm adding a 'status' field to users. Please:
1. Add the migration in db/migrate
2. Update the User model with validation
3. Update the UserSerializer to include status
4. Update the users controller to permit status
5. Add tests for the new field"
```

Cursor will generate changes for all relevant files.

### 2. Code Review Mode

Use Cursor to review your own code.

**Prompt:**

```
"Review this code for:
- Potential bugs
- Performance issues
- Security vulnerabilities
- Code smells
- Missing error handling

@Files:payment_processor.rb"
```

### 3. Documentation Generation

**For functions:**

```
"Generate JSDoc comments for all functions in @Files:utils.js"
```

**For APIs:**

```
"Generate OpenAPI/Swagger documentation for @Folder:controllers"
```

### 4. Test Generation

**Unit tests:**

```
"Generate RSpec tests for @Files:user_service.rb covering:
- Happy paths
- Edge cases
- Error scenarios"
```

**Integration tests:**

```
"Generate request specs for @Files:api/users_controller.rb"
```

### 5. Refactoring Sessions

**Systematic refactoring:**

```
"Let's refactor @Files:legacy_controller.rb step by step:
1. First, extract service objects
2. Then, add proper error handling
3. Finally, add comprehensive tests

Start with step 1."
```

### 6. Learning Mode

Use Cursor as a tutor.

**Examples:**

```
"Explain how this algorithm works line by line: [paste code]"

"What are the performance implications of this approach? Suggest alternatives."

"@Docs Next.js server components Explain the difference from client components"
```

---

## Common Pitfalls to Avoid

### 1. Blindly Accepting Suggestions

**Problem:** Accepting code without understanding it.

**Solution:** Always read and understand generated code. If you don't understand it, ask Cursor to explain.

### 2. Vague Prompts

**Problem:**

```
"fix this" or "make it better"
```

**Solution:** Be specific about what's wrong and what "better" means.

```
"This function is too slow when processing 10,000 items. Optimize it to handle large datasets efficiently."
```

### 3. Not Providing Enough Context

**Problem:**

```
"Add authentication"
```

**Solution:**

```
"Add JWT-based authentication to this Express API. I'm using:
- express-jwt for token validation
- bcrypt for password hashing
- MongoDB for user storage

See @Files:server.js for current setup."
```

### 4. Ignoring Project Conventions

**Problem:** Generated code doesn't match your project's style.

**Solution:** Create a `.cursorrules` file with your conventions, or be explicit in prompts:

```
"Generate this using our project conventions:
- Use arrow functions
- Use Tailwind classes, not inline styles
- Follow our naming convention (see @Files:CONVENTIONS.md)"
```

### 5. Not Iterating

**Problem:** Expecting perfect code on first generation.

**Solution:** Treat it as a conversation. Refine, improve, and iterate.

```
First: "Generate a user registration form"
Then: "Add form validation"
Then: "Add loading states and error handling"
Then: "Add success message after submission"
```

### 6. Over-Relying on AI

**Problem:** Using AI for everything, even simple tasks you should know.

**Solution:** Use AI to accelerate, not replace, your skills. For basic tasks, code it yourself to maintain proficiency.

---

## Real-World Workflows

### Workflow 1: Starting a New Feature

```
Step 1: "I need to build a comment system for blog posts. Help me plan the approach:
- What models do I need?
- What API endpoints?
- Any edge cases to consider?"

Step 2: [Review plan, make adjustments]

Step 3: "Let's start with the Comment model. Generate the migration and model with:
- belongs_to :post, :user
- validations for presence and length
- soft deletes (deleted_at)"

Step 4: [Review and test]

Step 5: "Now generate the API controller with CRUD operations"

Step 6: [Iterate on each component]
```

### Workflow 2: Debugging

```
Step 1: [Paste error message]
"I'm getting this error: [error]

Here's the relevant code: @Files:problem_file.rb

What's causing this and how do I fix it?"

Step 2: [Try the suggested fix]

Step 3: "That fixed the immediate error, but now I'm getting [new error]. 
Could this be related?"

Step 4: "This works now. Can you explain why the original approach failed?"
```

### Workflow 3: Code Review

```
Step 1: "Review @Files:new_feature.js for:
- Performance issues
- Security vulnerabilities  
- Best practices violations
- Missing error handling"

Step 2: [Review feedback]

Step 3: "Good catches. Fix the security issue you mentioned in #3"

Step 4: "Now add tests covering the edge cases you identified"
```

### Workflow 4: Learning a New Technology

```
Step 1: "@Docs react server components 
I'm new to server components. Explain the key concepts with examples"

Step 2: "Now show me how to fetch data in a server component"

Step 3: "Compare this to the old way with useEffect. What's better and why?"

Step 4: "Convert @Files:UserList.tsx from client to server component"
```

### Workflow 5: Refactoring Legacy Code

```
Step 1: "Analyze @Files:legacy.js and identify code smells and improvement opportunities"

Step 2: [Review suggestions]

Step 3: "Let's refactor incrementally. First, extract these magic numbers into constants"

Step 4: "Now split this 200-line function into smaller, focused functions"

Step 5: "Add tests for the refactored code"

Step 6: "Finally, update the documentation"
```

---

## Tips for Professional Development

### 1. Learn While You Code

```
"Why did you choose this approach over [alternative]?"
"Explain the tradeoffs of this solution"
"What are the performance implications?"
```

### 2. Code Quality Checks

```
"Review this for production readiness:
- Error handling
- Edge cases
- Performance
- Security
- Testability"
```

### 3. Architecture Discussions

```
"I'm debating between [Approach A] and [Approach B] for this feature.
Analyze the tradeoffs of each considering:
- Scalability
- Maintainability  
- Development speed
- Testing complexity"
```

### 4. Documentation

```
"Generate comprehensive documentation for @Folder:api including:
- Setup instructions
- API endpoints with examples
- Error codes and handling
- Authentication flow"
```

### 5. Test Coverage

```
"Analyze @Files:service.rb and identify:
- What's not tested
- What edge cases are missing
- Generate tests for uncovered code"
```

### 6. Performance Optimization

```
"Profile @Files:slow_query.rb and suggest optimizations.
Current execution time is 5 seconds with 10,000 records."
```

---

## Advanced Pro Tips

### 1. Context Management

Keep chat history focused:

- Start new chats for new features/topics
- Use @ mentions to add specific context
- Clear irrelevant context: "Ignore previous conversation, focus on this new task"

### 2. Version Control Integration

```
"@Git diff Show me what changed in the last commit and explain why"
"Review my uncommitted changes for issues"
```

### 3. Batch Operations

```
"For each file in @Folder:components:
1. Add PropTypes validation
2. Add error boundaries
3. Update to use our custom hooks"
```

### 4. Pattern Application

```
"Apply this error handling pattern to all API calls in @Folder:services:
[paste pattern]"
```

### 5. Codebase Analysis

```
"Analyze our codebase and identify:
- Duplicate code that should be extracted
- Inconsistent patterns
- Missing abstractions
- Technical debt hot spots"
```

---

## Keyboard Shortcuts Reference

| Shortcut | Action |
|----------|--------|
| `Cmd/Ctrl + L` | Open Chat |
| `Cmd/Ctrl + K` | Inline Edit |
| `Cmd/Ctrl + I` | Inline Generation |
| `Tab` | Accept Suggestion |
| `Esc` | Dismiss Suggestion |
| `Cmd/Ctrl + Shift + L` | New Chat |
| `@` | Trigger @ mentions |

---

## Final Thoughts

### Remember:

1. **Cursor is a tool, not a replacement** - It amplifies your skills, doesn't replace them
2. **Always review and understand** - Never ship code you don't understand
3. **Iterate and refine** - First generation is rarely perfect
4. **Provide context** - Better context = better results
5. **Learn from it** - Ask "why" to understand the reasoning
6. **Maintain your skills** - Don't become dependent; use it strategically

### Best Results Come From:

- Clear, specific prompts
- Iterative refinement
- Critical review
- Understanding the output
- Proper context with @ mentions
- Following project conventions (.cursorrules)

### Use Cursor For:

✅ Boilerplate generation
✅ Complex refactoring
✅ Test generation
✅ Documentation
✅ Learning new concepts
✅ Code review
✅ Debugging assistance
✅ Architecture discussions

### Don't Use Cursor For:

❌ Replacing critical thinking
❌ Shipping code you don't understand
❌ Avoiding learning fundamentals
❌ Making all architectural decisions
❌ Security-critical code without review

---

## Getting Help

- **Cursor Documentation**: https://docs.cursor.sh
- **Cursor Community**: https://forum.cursor.sh
- **Report Issues**: Within Cursor → Help → Report Issue

---

**Happy Coding with Cursor! 🚀**

Remember: The best developers using AI are those who know when to use it, when to question it, and when to rely on their own expertise.
