# Rails Take-Home Assessment Guide

## Pre-Assessment Setup (Do This Now)

### 1. Environment Check

```bash

# Verify your Ruby version

ruby -v

# Verify Rails installation

rails -v

# Verify bundler

bundle -v

# Test database connection (usually PostgreSQL or SQLite)

# You'll do this once you get the base app

```

### 2. Cursor Setup

- ✅ Cursor updated to latest version
- ✅ AI features enabled and working
- ✅ `.cursorrules` file ready to copy into project root
- ✅ Comfortable with Cursor's chat interface

### 3. Mental Preparation

- ✅ Block 3-hour uninterrupted time window
- ✅ Water/coffee ready
- ✅ Not tired or distracted
- ✅ Review this guide one more time


---


## Phase 1: Initial Setup (10 minutes)

### When You Receive the PRD Email

**Step 1: Clone/Download the Base Rails App**

```bash
cd ~/projects  # or wherever you work

# Clone or extract the base app

cd [project-name]

```

**Step 2: Copy Your .cursorrules File**

```bash
cp ~/.cursorrules .cursorrules

```

**Step 3: Setup the Application**

```bash
bundle install
rails db:create
rails db:migrate
rails db:seed  # if there's seed data

# Verify it runs

rails s

# Visit http://localhost:3000 to confirm it works

```

**Step 4: Initial Git Commit** (if not already a repo)

```bash
git init
git add .
git commit -m "Initial commit - base Rails application"

```

**Step 5: Read the PRD Thoroughly**
- Read it twice, completely
- Highlight/note the MUST HAVE requirements
- Identify nice-to-haves
- Note any ambiguities or questions


---


## Phase 2: Planning with Cursor (15 minutes)

### Open Cursor and Start Your First Interaction

**Prompt #1: Get the Implementation Plan**

```

I'm working on a Rails take-home assessment. Here's the PRD:

[PASTE ENTIRE PRD]

Based on this PRD and my .cursorrules file, help me:
1. Identify all the core requirements (must-haves)
2. Suggest the technical architecture (models, controllers, services)
3. List potential edge cases to handle
4. Provide a time-boxed implementation plan for the next 2.5 hours

Remember: I have 3 years Rails experience, so be concise.

```

**Review Cursor's Response and Ask Follow-ups:**

```

Good plan. A few questions:
- Should I use a service object for [complex logic], or is model logic sufficient here?
- What's the best way to handle [specific requirement from PRD]?
- Are there any gotchas in the PRD I should be aware of?

```

**Create Your Task List** (in your head or on paper):

```

☐ Models & migrations (30 min)
☐ Core controller actions (30 min)
☐ Service objects if needed (20 min)
☐ Error handling (15 min)
☐ Tests (30 min)
☐ Manual testing & polish (20 min)
☐ README & final review (15 min)

```


---


## Phase 3: Implementation (120 minutes)

### Part A: Models & Database (30 min)

**Prompt to Cursor:**

```

Let's start with the data model. Based on the requirements, generate:
1. The necessary models with appropriate associations
2. Database migrations with proper indexes and constraints
3. Basic model validations

Show me each migration separately so I can review them.

```

**Review Each Migration:**
- Check column types
- Verify indexes on foreign keys
- Ensure constraints match business rules
- Make sure migrations are reversible

**Generate and Review:**

```bash

# Let Cursor generate the commands, then run them

rails g model [ModelName] [attributes]

# Review the migration file before running

rails db:migrate

```

**Test in Console:**

```bash
rails c

# Create sample records to verify associations work

```

**Commit:**

```bash
git add .
git commit -m "Add [Model] with associations and validations"

```


---


### Part B: Controllers & Routes (30 min)

**Prompt to Cursor:**

```

Now let's implement the controller actions. Based on the PRD requirements:
1. Show me the routes we need in routes.rb
2. Generate the controller with the necessary actions
3. Each action should handle success and failure cases
4. Use proper HTTP status codes

Start with routes.rb

```

**Review Routes:**
- RESTful conventions followed?
- All required endpoints covered?
- Any custom routes named clearly?

**Generate Controller:**

```

Generate the [Resource]Controller with these actions:
- [list actions from PRD]

For each action:
- Keep it under 10 lines
- Extract complex logic to service objects if needed
- Handle errors with appropriate status codes
- Use strong parameters

```

**Review Controller Code:**
- Actions are thin?
- Strong parameters defined?
- Error handling present?
- Status codes correct?

**Test Each Endpoint Manually:**

```bash

# Use curl, Postman, or rails console

curl -X POST http://localhost:3000/api/resource \
  -H "Content-Type: application/json" \
  -d '{"key": "value"}'

```

**Commit:**

```bash
git add .
git commit -m "Add [Resource] controller with CRUD operations"

```


---


### Part C: Service Objects (if needed) (20 min)

**When to Create a Service:**
- Business logic involves multiple models
- Logic is >15 lines
- You'll need to test it independently
- PRD mentions complex operations (calculations, external APIs, multi-step processes)

**Prompt to Cursor:**

```

The [specific requirement] logic is complex. Let's extract it to a service object.

Create app/services/[operation]_service.rb that:
- Has a single `call` method
- Returns a result object or raises specific exceptions
- Handles all edge cases from the PRD
- Is easily testable

Show me the service and how to call it from the controller.

```

**Review Service:**
- Single responsibility?
- Clear return value/error handling?
- Edge cases covered?

**Update Controller:**

```ruby

# In controller action

result = SomeOperationService.call(params)
if result.success?
  render json: result.data, status: :ok
else
  render json: { error: result.error }, status: :unprocessable_entity
end

```

**Commit:**

```bash
git add .
git commit -m "Extract [operation] logic to service object"

```


---


### Part D: Error Handling & Edge Cases (15 min)

**Prompt to Cursor:**

```

Review my implementation for error handling. Specifically:
1. What edge cases am I missing based on the PRD?
2. Are all failure scenarios handled with appropriate responses?
3. Should I add any validations or guards?

Check: [list your controller actions]

```

**Add Error Handling:**

```ruby

# In controllers

rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

private

def not_found
  render json: { error: 'Resource not found' }, status: :not_found
end

def unprocessable_entity(exception)
  render json: { error: exception.message }, status: :unprocessable_entity
end

```

**Test Edge Cases Manually:**
- Invalid data
- Missing required fields  
- Not found scenarios
- Duplicate records (if applicable)

**Commit:**

```bash
git add .
git commit -m "Add comprehensive error handling and edge cases"

```


---


### Part E: Tests (30 min)

**Prompt to Cursor:**

```

Generate tests for my implementation. I need:

For Models:
- Validation tests
- Association tests
- Any custom method tests

For Controllers:
- Happy path tests for each action
- Error case tests (invalid data, not found, etc)

For Services (if applicable):
- Test successful execution
- Test failure scenarios
- Test edge cases

Use [RSpec/Minitest - check what the base app uses]

```

**Review and Run Tests:**

```bash

# For RSpec

rspec

# For Minitest

rails test

# Run specific test files as you create them

rspec spec/models/user_spec.rb

```

**If Tests Fail:**

```

These tests are failing: [paste error]
Help me fix the issue. Is it the test or the implementation?

```

**Aim for Coverage:**
- All happy paths tested ✓
- Key error scenarios tested ✓
- Edge cases from PRD tested ✓

**Commit:**

```bash
git add .
git commit -m "Add test coverage for models, controllers, and services"

```


---


### Part F: Manual Testing & Polish (20 min)

**Manual Testing Checklist:**

```

Start rails server and test each requirement from PRD:

☐ Requirement 1: [test it manually]
☐ Requirement 2: [test it manually]
☐ Requirement 3: [test it manually]
☐ Edge case 1: [verify it's handled]
☐ Edge case 2: [verify it's handled]

```

**Prompt to Cursor:**

```

Review my entire implementation against the PRD. Are we missing any requirements?

Also check for:
- Code smells or anti-patterns
- Opportunities for refactoring
- Any debugging code I forgot to remove

```

**Clean Up:**

```bash

# Remove any debugging code

# Fix any Cursor suggestions that make sense

# Ensure consistent code style

```

**Commit:**

```bash
git add .
git commit -m "Refactor and clean up implementation"

```


---


## Phase 4: Documentation & Submission (15 minutes)

### Update README

**Prompt to Cursor:**

```

Update the README.md with:
1. A brief description of what I implemented
2. Setup instructions (if different from base app)
3. How to run tests
4. Any architectural decisions or tradeoffs I made
5. Assumptions I made about the requirements

Keep it concise - under 200 words for the implementation section.

```

**Review README:**
- Clear and concise?
- All setup steps documented?
- Any new dependencies explained?

### Final Code Review

**Prompt to Cursor:**

```

Do a final code review of the entire implementation:
- Any violations of Rails best practices?
- Any security concerns?
- Any performance issues?
- Anything that doesn't follow the .cursorrules?

Be critical - what would you change if you were reviewing this PR?

```

**Address Critical Issues Only:**
- Fix anything that could break
- Fix obvious code smells
- Don't over-engineer at this stage

### Pre-Submission Checklist

```bash

# Run all tests one final time

rspec  # or rails test

# Check for any debugging code

grep -r "binding.pry" app/
grep -r "debugger" app/
grep -r "console.log" app/

# Verify all commits have good messages

git log --oneline

# Make sure migrations are in good shape

rails db:migrate:status

```

**Final Commit:**

```bash
git add .
git commit -m "Update README and final polish"

```


---


## Submission Package

### What to Include:

1. ✅ Your complete codebase (zip or repo link)
2. ✅ Cursor logs (check how they want this - screenshot? export?)
3. ✅ README with implementation notes
4. ✅ Any additional documentation they requested

### Before Hitting Send:

**Final Prompt to Cursor:**

```

I'm about to submit. Do one last check:
- Does everything in my code match the PRD requirements?
- Are there any obvious bugs or issues?
- Is the README clear?
- Did I follow all the Rails conventions in .cursorrules?

```


---


## Example Good Cursor Interactions Throughout

### ✅ Good Examples:

**Showing Critical Thinking:**

```

You suggested using a callback here. I'm hesitant because callbacks can 
make code hard to test and debug. Could we use a service object instead? 
What are the tradeoffs?

```

**Asking for Review:**

```

I just implemented [feature]. Review this code for:
1. Potential bugs
2. Edge cases I might have missed  
3. Rails anti-patterns
4. Performance issues

```

**Iterating on Solutions:**

```

This works but feels clunky. Can we refactor to make it more readable 
while keeping the same behavior?

```

**Documenting Decisions:**

```

I'm choosing to use a service object for this complex logic because:
1. It involves multiple models
2. It needs to be testable independently
3. The controller should stay thin

Generate the service with error handling.

```

### ❌ Bad Examples:

**Blindly Accepting:**

```

Generate a complete user management system
[accepts without reviewing]

```

**No Context:**

```

Fix this
[pastes code with no explanation]

```

**Letting Cursor Decide:**

```

What should I build?

```


---


## Time Management Red Flags

### If You're Behind Schedule:

**At 90 minutes - should have:**
- ✅ Models done
- ✅ Basic controller actions working
- ✅ At least one test passing

**Not there yet?**

```

Cursor, I'm behind schedule. Help me prioritize:
1. What's the minimum viable implementation for the PRD?
2. What can I defer to "nice-to-have"?
3. What's the fastest path to working code with at least basic tests?

```

**At 2 hours - should have:**
- ✅ All core features working
- ✅ Error handling in place
- ✅ Tests covering happy paths

**Not there yet? Triage:**
- Skip service objects, keep logic in models/controllers
- Test only critical happy paths
- Simplify edge case handling
- Focus on what's explicitly in the PRD


---


## Common Pitfalls to Avoid

### 1. Over-Engineering

- ❌ Don't build features not in the PRD
- ❌ Don't create elaborate architectures for simple requirements
- ✅ Build exactly what's asked, cleanly

### 2. Under-Testing

- ❌ Don't skip tests entirely
- ❌ Don't only test happy paths
- ✅ At minimum: model validations, controller happy paths, one error case

### 3. Ignoring the PRD

- ❌ Don't assume requirements
- ❌ Don't add your own "improvements"
- ✅ Build exactly to spec, note assumptions in README

### 4. Poor Time Management

- ❌ Don't spend 2 hours perfecting one feature
- ❌ Don't leave testing for the last 15 minutes
- ✅ Timebox each phase, move on when time's up

### 5. Silent Coding

- ❌ Don't code silently (they're reviewing logs!)
- ❌ Don't just accept Cursor's first suggestion
- ✅ Ask questions, review code, document decisions


---


## Emergency Scenarios

### "I'm Completely Stuck"

```

Cursor, I'm stuck on [specific problem]. I've tried [what you tried].
Help me debug:
1. What's the likely cause?
2. How can I verify my hypothesis?
3. What's the simplest fix?

```

### "Tests Are Failing and I Don't Know Why"

```

These tests are failing: [paste errors]
Here's my implementation: [paste code]

Help me:
1. Understand what's failing
2. Identify if it's a test issue or code issue
3. Fix it quickly

```

### "I'm Running Out of Time"

```

I have 30 minutes left and still need to:
- [list what's missing]

Help me prioritize what's absolutely critical vs what I can skip.
What's the minimum to meet the PRD requirements?

```


---


## Post-Submission Reflection

After you submit, jot down notes for yourself:
- What went well?
- What would you do differently?
- What Cursor interactions were most helpful?
- What would you improve about your workflow?

This will help you in future assessments or when using AI tools on the job.


---


## Remember:

1. **They're evaluating your judgment, not just your code**
2. **Show your thinking through Cursor interactions**
3. **Working, tested code > perfect, incomplete code**
4. **Follow the PRD exactly**
5. **Use Cursor as a collaborator, not a crutch**

You've got this! Your resume shows you know Rails well - trust your experience, use Cursor strategically, and focus on clean, working solutions.

Good luck! 🚀
