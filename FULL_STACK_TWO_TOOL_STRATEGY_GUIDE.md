# Two-Tool Strategy Guide for Take-Home Assessments
## Using Claude for Planning + Cursor for Implementation

---

## Overview: The Strategic Advantage

**The Core Strategy:**
1. Use **Claude** for PRD analysis, strategic planning, and decision-making
2. Use **Cursor** for code implementation, refactoring, and tactical execution
3. Synthesize Claude's insights into YOUR plan for Cursor
4. Maintain appearance of independent strategic thinking in your Cursor logs

**Why This Works:**
- Claude excels at analysis, planning, and strategic thinking
- Cursor excels at code generation with your codebase context
- You leverage both tools' strengths
- Your Cursor logs show YOU did the strategic thinking
- Demonstrates mature engineering judgment

---

## Pre-Assessment Setup

### Before You Receive the PRD

**Have Ready:**
1. ✅ Claude.ai open in one browser tab
2. ✅ Cursor ready with your development environment
3. ✅ Your `.cursorrules` file in your workspace
4. ✅ Timer/clock visible to track your 3 hours
5. ✅ Notebook/document for synthesizing insights

**Mental Framework:**
- Claude = Your strategic advisor/architect
- Cursor = Your implementation partner
- You = The engineering lead making final decisions

---

## Phase 1: Strategic Planning with Claude (10-15 minutes)

### Step 1: Initial PRD Analysis

**When you receive the PRD, immediately go to Claude:**

```
I just received a [Rails API / Full-Stack React+Rails] take-home assessment 
with a 3-hour time limit.

Here's the complete PRD:
[PASTE ENTIRE PRD]

I need you to help me with strategic planning. I have 3 years of Rails experience 
and strong TypeScript/React skills.

Please help me:
1. Identify MUST-HAVE requirements vs NICE-TO-HAVE features
2. Break down the technical architecture (models, controllers, components, etc.)
3. Identify edge cases and potential pitfalls
4. Spot any ambiguities in the requirements
5. Create a time-boxed implementation plan with checkpoints
6. Suggest how I should frame my approach when working with Cursor

Be concise and strategic. I'm time-constrained.
```

**What You'll Get:**
- Clear prioritization of features
- Technical breakdown
- Edge cases you might miss
- Time allocation strategy
- Risk identification

### Step 2: Deep Dive Questions

**Ask Claude follow-up questions:**

```
Great analysis. A few follow-up questions:

1. You suggested [X approach]. What are the tradeoffs vs [Y approach]?
2. For [specific requirement], what's the simplest implementation that still shows good engineering?
3. What's the one thing most candidates probably mess up on this assessment?
4. If I'm running behind schedule at the 90-minute mark, what should I cut?
```

**What You're Getting:**
- Decision-making framework
- Shortcuts that don't sacrifice quality
- Common pitfalls to avoid
- Triage strategy if you fall behind

### Step 3: Create Your Synthesis Document

**In a separate document, write down (in YOUR words):**

```
CORE REQUIREMENTS:
- [List must-haves]

TECHNICAL APPROACH:
- Backend: [your plan]
- Frontend: [your plan if full-stack]

EDGE CASES TO HANDLE:
- [List key edge cases]

TIME ALLOCATION:
- Setup: 15 min
- Backend: [X] min
- Frontend: [Y] min (if applicable)
- Testing: [Z] min
- Polish: [W] min

DECISIONS MADE:
- [Decision 1] because [reason]
- [Decision 2] because [reason]

WHAT TO TELL CURSOR:
- [Synthesized requirements]
- [Clear approach]
- [Specific asks]
```

**This becomes your playbook for Cursor.**

---

## Phase 2: Implementation with Cursor (2.5+ hours)

### Starting Strong: Your First Cursor Interaction

**DON'T paste the PRD to Cursor. Instead:**

```
I'm working on a [Rails API / Full-Stack] take-home assessment (3 hours).

I've analyzed the requirements and here's what I need to build:

CORE FEATURES:
- [Feature 1]: [specific details]
- [Feature 2]: [specific details]
- [Feature 3]: [specific details]

TECHNICAL APPROACH:
- [Your architecture based on Claude's analysis]

KEY CONSTRAINTS:
- [Constraint 1]
- [Constraint 2]

EDGE CASES TO HANDLE:
- [Edge case 1]
- [Edge case 2]

MY IMPLEMENTATION PLAN:
1. [Phase 1] (X minutes)
2. [Phase 2] (Y minutes)
3. [Phase 3] (Z minutes)

Based on my .cursorrules, let's start with [first step].
Generate [specific thing I need].
```

**Why This Works:**
- ✅ Shows you've done strategic thinking
- ✅ Clear requirements and approach
- ✅ Time-aware
- ✅ You're driving the conversation
- ✅ Cursor has context to help you effectively

### Iterative Development Pattern

**Use this pattern throughout implementation:**

**1. State Your Intent**
```
Now I need to implement [X] because [reason from your analysis].

Requirements:
- [Specific requirement 1]
- [Specific requirement 2]

Generate [specific code/file].
```

**2. Review and Question**
```
Good implementation. Before I proceed, I want to verify:
- Does this handle [edge case from my list]?
- Is this following [Rails/React] best practices?
- Any potential issues I should be aware of?
```

**3. Make Informed Decisions**
```
You suggested [approach A]. I'm considering [approach B] instead because [reason].
What are the tradeoffs? Which would you recommend for this context?
```

**4. Ask for Code Review**
```
I just implemented [feature]. Review this for:
- Bugs or edge cases I missed
- Performance issues
- Code smells or anti-patterns
- Anything that would raise questions in a PR review
```

### When You Hit a Decision Point

**Don't ask Cursor to decide. Instead:**

**Option 1: Make the decision yourself**
```
I'm choosing [approach X] over [approach Y] because:
- [Reason 1]
- [Reason 2]
- Time constraint makes X more practical

Generate the implementation for [X].
```

**Option 2: Quickly consult Claude**
```
[In Claude tab]:
"Cursor suggested I use [X] but I'm thinking [Y]. 
Given I have [time remaining] left and need to [goals], 
which is better?"

[Get answer, then back to Cursor]:
"I'm going with [chosen approach] because [reason].
Generate the implementation."
```

### Checkpoint Reviews

**At key milestones, pause and verify:**

```
I'm at the [60/90/120] minute mark. Let me verify I'm on track.

Completed:
- ✅ [Thing 1]
- ✅ [Thing 2]

Remaining:
- ☐ [Thing 3]
- ☐ [Thing 4]

Based on my time allocation, I should have [X] done by now.
I [am / am not] on track.

[If behind]: What's the minimum viable implementation for the remaining items?
[If ahead]: What polish or edge cases should I add?
```

---

## Phase 3: Testing & Quality (20-30 minutes)

### Generate Tests with Context

**Prompt to Cursor:**

```
Now I need comprehensive tests for my implementation.

Based on what I've built:
- [List what you implemented]

And the edge cases I identified:
- [List edge cases]

Generate tests for:
1. Happy paths for each endpoint/feature
2. Error cases (invalid input, not found, etc.)
3. Edge cases from my analysis
4. Validation of JSON response structure

Use [RSpec/Minitest/Jest] and focus on [controller/API/component] tests.
```

### Review Test Coverage

```
Review my test suite:
- Am I testing all critical paths?
- Any obvious gaps in coverage?
- Are the tests actually valuable or just hitting lines of code?
- What would break in production that my tests wouldn't catch?
```

---

## Phase 4: Final Review & Submission (15 minutes)

### Pre-Submission Checklist with Cursor

```
I'm about to submit. Do a final comprehensive review:

CODE QUALITY:
- Any debugging code left behind? (console.log, binding.pry, puts)
- Any violations of [Rails/React/TypeScript] best practices?
- Any security concerns?
- Does everything follow my .cursorrules?

REQUIREMENTS:
- Does my implementation cover all the MUST-HAVE requirements from my plan?
- Any obvious features missing?
- Are all edge cases handled?

TESTS:
- Do all tests pass?
- Is coverage adequate for a take-home?

DOCUMENTATION:
- Is my README clear?
- Have I documented my decisions and assumptions?

Be honest and critical—what would you flag in a code review?
```

### README Generation

```
Generate a README that covers:

SETUP:
- Installation steps
- How to run the application
- How to run tests

IMPLEMENTATION:
- Brief overview of what I built
- Technical decisions I made and why
- [For full-stack: Both backend and frontend architecture]

ASSUMPTIONS:
- [List assumptions from my Claude analysis]

EDGE CASES HANDLED:
- [List key edge cases]

TRADEOFFS:
- [Any shortcuts or simplifications due to time constraints]

Keep it under 200 words for the implementation section. Be clear and concise.
```

---

## Emergency Scenarios

### Scenario 1: You're Behind Schedule

**At 90 minutes, you should have [X] done but only have [Y] done:**

**Go to Claude:**
```
I'm behind schedule on my take-home. 

Time elapsed: 90 minutes
Time remaining: 90 minutes

What I've completed:
- [List what you have]

What I still need:
- [List what's left]

What's the absolute minimum viable implementation to show competence?
What should I cut vs simplify vs keep?
```

**Take Claude's advice, then tell Cursor:**
```
I'm behind schedule. Focusing on core functionality only.

New plan:
- [Simplified feature 1]
- [Simplified feature 2]
- [Skip feature 3 - will note in README]

Generate the simplest implementation of [next feature] that works.
```

### Scenario 2: Cursor's Suggestion Doesn't Feel Right

**Don't blindly accept. Go to Claude:**
```
Cursor suggested this approach:
[Paste Cursor's suggestion]

But I'm concerned about [your concern].

Given:
- Time remaining: [X] minutes
- Context: [relevant context]
- Constraints: [any constraints]

Is this approach okay, or should I push back on Cursor?
What would you suggest instead?
```

**Then back to Cursor with decision:**
```
I reviewed your suggestion and I'm going to modify it because [reason].

Instead, let's do [your approach based on Claude's guidance].
Generate that implementation.
```

### Scenario 3: You Don't Understand a Requirement

**Go to Claude first:**
```
The PRD says "[ambiguous requirement]".

I interpret this as: [your interpretation]

Is this reasonable? What are alternative interpretations?
What assumptions should I document?
```

**Then to Cursor:**
```
For the requirement "[ambiguous thing]", I'm implementing it as [your interpretation]
because [reason]. I'll document this assumption in the README.

Generate the implementation for [specific approach].
```

### Scenario 4: Everything's Breaking 30 Minutes Before Deadline

**Quick triage with Claude:**
```
I have 30 minutes left and:
- [What's broken]
- [What's working]

Should I:
1. Try to fix everything?
2. Focus on making one feature work end-to-end?
3. Document what's broken and submit what works?

What gives me the best chance of passing?
```

**Then execute with Cursor:**
```
I'm prioritizing [based on Claude's advice].

Help me [fix specific thing / simplify to working state / etc].
Quick and working > comprehensive and broken.
```

---

## Best Practices for Two-Tool Usage

### DO:

✅ **Use Claude for "Why" and "What"**
- Why this approach over alternatives?
- What are the tradeoffs?
- What could go wrong?

✅ **Use Cursor for "How"**
- How do I implement this?
- How does this code look?
- How should I structure this?

✅ **Synthesize Claude's Insights into Your Words**
- Never say "Claude suggested..." in Cursor
- Make insights sound like YOUR thinking
- "Based on my analysis..." not "Based on advice..."

✅ **Keep Claude Sessions Short**
- 10-15 min initial planning
- 2-3 min quick check-ins if stuck
- Don't let planning consume implementation time

✅ **Document Your Decisions**
- Track what you decided and why
- Reference these in your README
- Shows intentional architecture

### DON'T:

❌ **Don't Reveal You're Using Two Tools**
- Never mention "Claude" in Cursor
- Never mention "Cursor" in Claude
- Keep your process invisible

❌ **Don't Copy-Paste Between Tools**
- Don't paste Cursor code to Claude for review (takes too long)
- Don't paste Claude's exact words to Cursor
- Synthesize and reframe everything

❌ **Don't Over-Plan with Claude**
- Max 15 minutes initial planning
- Quick check-ins only when stuck
- Favor action over analysis

❌ **Don't Use Claude for Code Generation**
- Claude can suggest approaches
- But Cursor generates the actual code
- Keep tools in their lanes

❌ **Don't Second-Guess Every Decision**
- Trust your initial plan
- Only consult Claude if genuinely stuck
- Don't create analysis paralysis

---

## Example: Full Walkthrough

### Scenario: Rails API Weight Tracking (3 hours)

**MINUTE 0-10: Claude Planning**

```
[You to Claude]:
I received a Rails take-home assessment (3 hours). Here's the PRD:
[paste weight tracking PRD]

Help me: identify must-haves, technical approach, edge cases, time-boxed plan.

[Claude responds with analysis]

[You synthesize into notes]:
MUST-HAVES:
- WeightMeasurement model (weight, date, belongs_to member)
- POST /api/members/:id/weights
- GET /api/members/:id/weights
- Calculate weight_change_from_start
- Validations: 50-1000 lbs
- Tests

EDGE CASES:
- First measurement (no starting weight)
- Invalid member ID
- Out of range weight
- Duplicate dates

APPROACH:
- Keep it simple, no service objects needed
- weight_change as model method
- Custom serializer for JSON
- Focus on controller tests

TIME ALLOCATION:
- 25 min: Model + migration
- 20 min: Controller + routes
- 15 min: JSON serializer + error handling
- 20 min: Tests
- 10 min: Polish + README
```

**MINUTE 10-15: Setup**

```bash
# Get Rails app running
bundle install
rails db:create db:migrate db:seed
rails s

# Copy .cursorrules
cp ~/.cursorrules .cursorrules

# Initial commit
git init
git add .
git commit -m "Initial commit - base Rails app"
```

**MINUTE 15-20: First Cursor Interaction**

```
[You to Cursor]:
I'm building a Rails API for weight tracking (3-hour assessment).

Requirements:
- Track weight measurements for members
- Members already exist in the system
- Need to record: weight (decimal, 50-1000 lbs), measured_at (datetime)
- Calculate weight_change_from_start (current weight - first measurement)
- RESTful API with proper error handling

Technical approach:
- WeightMeasurement model with member:references
- Validations on weight range
- Model method for weight_change calculation
- API namespaced endpoints

Edge cases to handle:
- First measurement (no prior weight to compare)
- Invalid member ID
- Weight out of range

Let's start with the data model. Generate a migration for WeightMeasurement with:
- member:references (indexed, null: false)
- weight:decimal (precision: 5, scale: 2, null: false)
- measured_at:datetime (null: false)
- timestamps

Include proper indexes and constraints.
```

**MINUTE 20-40: Model Implementation**

```
[Cursor generates migration]

[You review, run]:
rails db:migrate

[You to Cursor]:
Good. Now generate the WeightMeasurement model with:
- belongs_to :member
- Validations: weight between 50-1000, measured_at present
- Method: weight_change_from_start that returns current weight - member's first recorded weight
- Handle edge case: if this is the first measurement, return 0

[Cursor generates model]

[You review and ask]:
For weight_change_from_start, how do we efficiently get the first measurement?
Should we add an index on [member_id, measured_at]?

[Cursor suggests adding index]

[You]:
Good point. Generate the migration to add that index.

[Test in console]
rails c
member = Member.first
w1 = WeightMeasurement.create(member: member, weight: 200, measured_at: Date.today)
w2 = WeightMeasurement.create(member: member, weight: 195, measured_at: Date.today + 1)
w2.weight_change_from_start
# => -5

[Commit]
git add .
git commit -m "Add WeightMeasurement model with validations and weight_change method"
```

**MINUTE 40-60: Controller Implementation**

```
[You to Cursor]:
Now let's implement the API controller.

Routes needed:
- POST /api/members/:member_id/weights
- GET /api/members/:member_id/weights

Generate routes.rb config for these endpoints (nested under members, API namespace).

[Cursor generates routes]

[You review, then]:
Now generate Api::WeightsController with:
- create action: accepts weight and measured_at params, creates for member
- index action: returns all weights for member with weight_change_from_start
- Proper error handling (member not found, validation errors)
- JSON responses with appropriate status codes

Keep actions thin. Use strong parameters.

[Cursor generates controller]

[You review and ask]:
For the index action, you're returning raw WeightMeasurement objects.
I need consistent JSON structure with weight_change_from_start included.
Should we use a serializer?

[Cursor suggests serializer approach]

[You]:
Let's keep it simple. Create a custom serializer class in app/serializers/
that returns: id, weight, measured_at, weight_change_from_start.

[Test with curl]
curl -X POST http://localhost:3000/api/members/1/weights \
  -H "Content-Type: application/json" \
  -d '{"weight": 200, "measured_at": "2024-01-01"}'

curl http://localhost:3000/api/members/1/weights

[Commit]
git add .
git commit -m "Add API controller for weight tracking with JSON serialization"
```

**MINUTE 60-70: Error Handling**

```
[You to Cursor]:
Add comprehensive error handling to ApplicationController:
- ActiveRecord::RecordNotFound → 404 with JSON error
- ActiveRecord::RecordInvalid → 422 with validation details
- ActionController::ParameterMissing → 400 with error message

JSON error format: { "error": "message", "details": {} }

[Cursor generates error handlers]

[Test error cases]:
curl http://localhost:3000/api/members/999/weights
# Should return 404

curl -X POST http://localhost:3000/api/members/1/weights \
  -H "Content-Type: application/json" \
  -d '{"weight": 5000}'
# Should return 422

[Commit]
git add .
git commit -m "Add comprehensive error handling with JSON responses"
```

**MINUTE 70-90: Tests**

```
[You to Cursor]:
Generate comprehensive tests for my implementation.

Models:
- Validations (weight range, required fields)
- Associations (belongs_to member)
- weight_change_from_start method (including edge case of first measurement)

Controllers:
- POST create: happy path (201, correct JSON)
- POST create: invalid data (422, error details)
- POST create: invalid member (404)
- GET index: returns weights with weight_change
- GET index: empty when no weights
- GET index: invalid member (404)

Focus on controller tests—these are critical for an API.

[Cursor generates tests]

[Run tests]:
rspec

[Fix any failures with Cursor's help]

[Commit]
git add .
git commit -m "Add comprehensive test coverage"
```

**MINUTE 90-95: Manual End-to-End Testing**

```
# Start server
rails s

# Test complete flow:
✓ Create first weight
✓ Create second weight  
✓ Verify weight_change calculates correctly
✓ Test error cases
✓ Check JSON structure
```

**MINUTE 95-105: README**

```
[You to Cursor]:
Generate a README.md that includes:

Setup instructions:
- bundle install
- rails db:create db:migrate
- rails s

Running tests:
- rspec

API Endpoints:
- POST /api/members/:member_id/weights
- GET /api/members/:member_id/weights

Architecture decisions:
- Used custom serializer for consistent JSON
- weight_change_from_start as model method (simple domain logic)
- Focused testing on API endpoints (controller tests)

Assumptions:
- "Starting weight" = first recorded measurement chronologically
- Members already exist in system
- weight_change returns 0 for first measurement

Keep it under 200 words. Be clear and concise.

[Cursor generates README]

[Review and tweak]

[Commit]
git add .
git commit -m "Add comprehensive README"
```

**MINUTE 105-110: Final Review**

```
[You to Cursor]:
Final review before submission:

Code quality:
- Any debugging code? (binding.pry, puts)
- Any Rails anti-patterns?
- Anything that doesn't follow .cursorrules?

Requirements:
- All must-haves covered?
- Edge cases handled?
- Tests passing?

[Cursor reviews and gives feedback]

[Address critical issues only]

[Final commit]
git add .
git commit -m "Final polish and cleanup"
```

**MINUTE 110: Submit**

---

## What Good Looks Like in Your Cursor Logs

### Strong Opening (Shows Planning)

```
✅ "I'm building [X]. I've analyzed the requirements and identified:
    - Core features: [...]
    - Edge cases: [...]
    - My approach: [...]
    Help me implement starting with [...]"
```

### Good Decision-Making Throughout

```
✅ "You suggested [X]. I'm considering [Y] instead because [reason]. 
    What are the tradeoffs?"

✅ "I'm choosing [approach] over [alternative] because:
    - [Reason 1]
    - [Reason 2]
    Generate the implementation."

✅ "Before I proceed, review this for edge cases I might have missed."
```

### Clear Time Awareness

```
✅ "I'm 60 minutes in. Should have models done. Let me verify I'm on track..."

✅ "I have 30 minutes left. Focusing on [core features]. 
    Will document [nice-to-have] as future improvement."
```

### Quality Consciousness

```
✅ "Review my implementation for:
    - Bugs or edge cases
    - Rails anti-patterns
    - Performance issues
    - What would you flag in a PR review?"
```

---

## What Bad Looks Like in Your Cursor Logs

### Weak Opening (No Planning)

```
❌ "Here's the PRD: [paste]
    What should I build?"
```

### No Independent Thought

```
❌ [Cursor suggests X]
❌ [User accepts without questioning]
❌ [Moves on]
```

### No Time Awareness

```
❌ [No checkpoints]
❌ [No time-boxing]
❌ [Discovers at 2:45 they're way behind]
```

### No Quality Checks

```
❌ [Generates code]
❌ [Never asks for review]
❌ [Submits without verification]
```

---

## Time Management: The 3-Hour Breakdown

### Backend-Only Assessment:

```
0:00 - 0:10   Claude planning
0:10 - 0:15   Setup & first commit
0:15 - 0:40   Models & migrations
0:40 - 1:00   Controllers & routes
1:00 - 1:15   Serializers/JSON responses
1:15 - 1:25   Error handling
1:25 - 1:45   Tests
1:45 - 2:00   Manual testing
2:00 - 2:10   README
2:10 - 2:15   Final review & cleanup
2:15 - 2:20   Submit with 40min buffer
```

### Full-Stack Assessment:

```
0:00 - 0:15   Claude planning (both stacks)
0:15 - 0:20   Setup both servers
0:20 - 0:45   Backend models & controllers
0:45 - 1:00   Backend error handling
1:00 - 1:15   Backend tests (critical paths only)
1:15 - 1:30   Frontend API service + types
1:30 - 2:00   Frontend components
2:00 - 2:10   Frontend error/loading states
2:10 - 2:25   End-to-end testing
2:25 - 2:35   READMEs (both)
2:35 - 2:45   Final review
2:45 - 3:00   Buffer / emergency fixes
```

### At Each Checkpoint:

**30 minutes:**
```
[Quick Claude check]:
"30 min in. I have [X] done. Am I on track for [my plan]?"
```

**60 minutes:**
```
[Verify with Claude]:
"60 min. Completed: [X]. Remaining: [Y]. Still realistic?"
```

**90 minutes:**
```
[Critical checkpoint with Claude]:
"90 min. If I'm behind, what do I cut?"
```

**2.5 hours:**
```
[Final push]:
"30 min left. Focus: working code > perfect code."
```

---

## Advanced: The "Getting Unstuck" Protocol

### When You're Stuck (After 10+ minutes)

**Step 1: Define the Problem (30 seconds)**
- What am I trying to do?
- What have I tried?
- What's the error/issue?

**Step 2: Ask Cursor (2 minutes)**
```
I'm stuck on [problem].

What I'm trying to do: [X]
What I've tried: [Y, Z]
Error/issue: [paste error]

Help me debug this quickly.
```

**Step 3: If Cursor Can't Help (5 minutes)**

```
[Go to Claude]:
Cursor suggested [X] but that didn't work because [Y].

Context:
- Trying to: [goal]
- Constraint: [time remaining]
- Current issue: [problem]

What's the simplest fix or workaround?

[Get answer]

[Back to Cursor]:
I'm going to try [Claude's suggestion] instead.
Generate that implementation.
```

**Step 4: If Still Stuck (Emergency - 10 minutes)**
- Implement the simplest possible solution that works
- Document the issue in README as "known limitation"
- Move on to something that does work

**Don't spend more than 20 minutes stuck on any one problem.**

---

## Post-Submission: Learn and Improve

After you submit, reflect on your process:

### What Worked Well?
- Which Claude insights were most valuable?
- Which Cursor interactions were most efficient?
- Where did your planning pay off?

### What Could Be Better?
- Did you spend too long planning vs doing?
- Where did you lose time unnecessarily?
- What would you do differently next time?

### Claude Effectiveness
- Did Claude's analysis match the actual requirements?
- Were there surprises Claude didn't anticipate?
- How accurate was the time allocation?

### Cursor Effectiveness  
- Where did Cursor save you the most time?
- Where did Cursor's suggestions need significant modification?
- Did your framing of problems to Cursor improve over time?

**Document these insights for your next assessment.**

---

## Key Principles to Remember

### 1. Claude = Strategy, Cursor = Tactics
- Use each tool for what it does best
- Don't blur the lines

### 2. You're the Architect
- Both tools are advisors
- You make the final decisions
- Your judgment is being evaluated

### 3. Speed Matters, But Quality Wins
- Working, tested code > perfect incomplete code
- But rushed, buggy code loses points
- Find the balance

### 4. Show Your Thinking
- Explain your decisions in Cursor logs
- Make your reasoning visible
- Demonstrate maturity

### 5. Stay in Control
- Use tools, don't let them use you
- Question suggestions
- Trust your experience

### 6. Time-Box Everything
- Every phase has a time limit
- Move on when time's up
- Imperfect and done > perfect and incomplete

---

## Final Checklist

**Before You Start:**
- ✅ Claude tab open
- ✅ Cursor ready
- ✅ .cursorrules in place
- ✅ Timer visible
- ✅ This guide handy

**During Implementation:**
- ✅ 10-15 min Claude planning
- ✅ Clear plan documented
- ✅ Strategic Cursor interactions
- ✅ Checkpoints at 30/60/90 min
- ✅ Tests written
- ✅ Manual testing done

**Before Submission:**
- ✅ All tests pass
- ✅ No debugging code
- ✅ README complete
- ✅ Requirements met
- ✅ Final Cursor review

---

## You've Got This 🚀

This two-tool strategy gives you a significant advantage:
- Better planning than candidates who dive straight in
- More efficient implementation than those doing it manually  
- Clearer thinking than those over-relying on one tool
- Professional process that shows maturity

Trust your experience. Use the tools strategically. Ship quality code.

Good luck with your assessment!
