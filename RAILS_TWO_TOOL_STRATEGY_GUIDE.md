# Two-Tool Strategy Guide for Rails API Take-Home Assessments
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

**Perfect For:**
- Rails API assessments (2-3 hours)
- Backend-only take-homes
- RESTful API design challenges
- Database modeling assessments

---

## Pre-Assessment Setup

### Before You Receive the PRD

**Have Ready:**
1. ✅ Claude.ai open in one browser tab
2. ✅ Cursor ready with your development environment
3. ✅ Your `.cursorrules` file ready to copy
4. ✅ Timer/clock visible to track your time
5. ✅ Notebook/document for synthesizing insights
6. ✅ curl or Postman for API testing

**Environment Check:**
```bash
# Verify versions
ruby -v
rails -v
bundle -v

# Verify database (usually PostgreSQL or SQLite)
psql --version  # or sqlite3 --version
```

**Mental Framework:**
- Claude = Your senior architect/technical advisor
- Cursor = Your implementation partner
- You = The engineering lead making final decisions

---

## Phase 1: Strategic Planning with Claude (10-15 minutes)

### Step 1: Initial PRD Analysis

**When you receive the PRD, immediately go to Claude:**

```
I just received a Rails API take-home assessment with a [2-3] hour time limit.

Here's the complete PRD:
[PASTE ENTIRE PRD]

I need you to help me with strategic planning. I have 3 years of Rails experience 
with strong knowledge of RESTful API design, database modeling, and testing.

Please help me:
1. Identify MUST-HAVE requirements vs NICE-TO-HAVE features
2. Break down the technical architecture:
   - Data models and associations
   - Controller structure
   - API endpoints needed
   - Serialization approach
3. Identify edge cases and potential pitfalls
4. Spot any ambiguities in the requirements
5. Suggest whether I need service objects or if models/controllers are sufficient
6. Create a time-boxed implementation plan with checkpoints
7. Suggest how I should frame my approach when working with Cursor

Be concise and strategic. I'm time-constrained.
```

**What You'll Get:**
- Clear prioritization of features
- Technical breakdown (models, controllers, routes)
- Edge cases you might miss
- Service object recommendations
- Time allocation strategy
- Risk identification

### Step 2: Deep Dive Questions

**Ask Claude follow-up questions:**

```
Great analysis. A few follow-up questions:

1. You suggested [X approach for serialization]. What are the tradeoffs vs [Y approach]?
2. For [specific requirement], should I use a service object or keep it in the model?
3. What's the fastest approach to testing that still shows quality? Should I focus on 
   controller tests or model tests?
4. What's the one thing most candidates probably mess up on this assessment?
5. If I'm running behind schedule at the 90-minute mark, what should I cut first?
6. Any Rails-specific gotchas I should watch out for?
```

**What You're Getting:**
- Decision-making framework
- Testing strategy
- Shortcuts that don't sacrifice quality
- Common pitfalls to avoid
- Triage strategy if you fall behind

### Step 3: Create Your Synthesis Document

**In a separate document, write down (in YOUR words):**

```
CORE REQUIREMENTS:
- [List must-haves for API]
- [Endpoints needed]

DATA MODEL:
- Models: [model 1, model 2, model 3]
- Associations: [relationships]
- Key validations: [what needs validation]

API ENDPOINTS:
- GET /api/resources - [what it does]
- POST /api/resources - [what it does]
- [other endpoints]

EDGE CASES TO HANDLE:
- [Edge case 1]
- [Edge case 2]
- [Edge case 3]

TECHNICAL DECISIONS:
- Serialization: [approach and why]
- Service objects: [yes/no and why]
- Error handling: [strategy]
- Testing focus: [what to prioritize]

TIME ALLOCATION:
- Setup & planning: 15 min
- Models & migrations: 25 min
- Controllers & routes: 25 min
- Serialization/error handling: 15 min
- Tests: 25 min
- Manual testing: 10 min
- README & polish: 10 min

WHAT TO TELL CURSOR:
- [Synthesized requirements in your words]
- [Clear technical approach]
- [Specific implementation requests]
```

**This becomes your playbook for Cursor.**

---

## Phase 2: Implementation with Cursor (2.5+ hours)

### Part A: Setup (5 minutes)

**First, get the base app running:**

```bash
cd project-directory
bundle install
rails db:create db:migrate db:seed
rails s  # Verify it works

# Copy your .cursorrules
cp ~/.cursorrules .cursorrules

# Initial commit
git init
git add .
git commit -m "Initial commit - base Rails application"
```

### Part B: Your First Cursor Interaction

**DON'T paste the PRD to Cursor. Instead:**

```
I'm working on a Rails API take-home assessment ([2-3] hours).

I've analyzed the requirements and here's what I need to build:

CORE FEATURES:
- [Feature 1 with specific details]
- [Feature 2 with specific details]
- [Feature 3 with specific details]

DATA MODEL:
- [Model 1]: [fields, associations]
- [Model 2]: [fields, associations]

API ENDPOINTS:
- [Endpoint 1]: [method, path, purpose]
- [Endpoint 2]: [method, path, purpose]

KEY VALIDATIONS:
- [Validation 1]
- [Validation 2]

EDGE CASES TO HANDLE:
- [Edge case 1]
- [Edge case 2]

TECHNICAL APPROACH:
- [Your serialization strategy]
- [Your error handling strategy]
- [Service objects: yes/no]

Based on my .cursorrules, let's start with the data model.
Generate the migration for [first model] with [specific fields and constraints].
```

**Why This Works:**
- ✅ Shows you've done strategic thinking
- ✅ Clear requirements and approach
- ✅ Time-aware and focused
- ✅ You're driving the conversation
- ✅ Cursor has context to help you effectively

### Part C: Models & Migrations (25 minutes)

**Iterative pattern for each model:**

**1. Request Migration**
```
Generate a migration for [ModelName] with:
- [field1]: [type] ([constraints])
- [field2]: [type] ([constraints])
- [association]: references (indexed: true, null: false)
- timestamps

Include proper indexes on:
- [field that needs index]
- [association foreign keys]
```

**2. Review Before Running**
```
Before I run this migration, check:
- Are the column types appropriate for the data?
- Do I have indexes on all foreign keys?
- Are null constraints appropriate?
- Is the migration reversible?
```

**3. Generate Model**
```
Now generate the [ModelName] model with:
- Associations: [belongs_to, has_many, etc.]
- Validations: [specific validations from your analysis]
- Any custom methods needed: [method names and purposes]

Keep model methods focused and under 10 lines each.
```

**4. Test in Console**
```bash
rails db:migrate
rails c

# Test the associations
model1 = Model1.create(valid_attributes)
model2 = Model2.create(model1: model1, other_attributes)
model1.model2s  # Test associations work

# Test validations
Model1.create(invalid_attributes)  # Should fail
```

**5. Commit**
```bash
git add .
git commit -m "Add [ModelName] with associations and validations"
```

**Repeat for each model.**

**Time checkpoint (25 min mark):**
```
[Quick check with yourself]:
✅ All models created?
✅ Migrations run cleanly?
✅ Associations working in console?
✅ Validations present?

[If behind]: Skip custom model methods for now, come back if time.
[If on track]: Continue to controllers.
```

### Part D: Controllers & Routes (25 minutes)

**1. Routes First**
```
Based on my requirements, I need these API endpoints:
- [List each endpoint with HTTP method]

Generate the routes.rb configuration.
Use API namespace if appropriate: namespace :api do
Follow RESTful conventions where possible.
```

**2. Review Routes**
```
Review these routes:
- Do they follow RESTful conventions?
- Are they properly namespaced?
- Any missing endpoints from my requirements?
- Any unnecessary routes?
```

**3. Generate Controller**
```
Generate the [Api::]ResourceController with these actions:
- [action1]: [what it does]
- [action2]: [what it does]

For each action:
- Keep it under 10 lines (extract to service objects if needed)
- Use strong parameters
- Return proper HTTP status codes (200, 201, 404, 422, etc.)
- Return JSON responses
- Handle errors gracefully

Start with the [first action].
```

**4. Implement Action by Action**
```
For the [create] action:
- Accept [parameters]
- Validate [requirements]
- If valid: create resource, return 201 with JSON
- If invalid: return 422 with error details
- If parent not found: return 404

Generate the implementation with strong parameters.
```

**5. Review Controller Code**
```
Review this controller action:
- Is it thin enough or should logic move to model/service?
- Are strong parameters defined correctly?
- Is error handling present?
- Are HTTP status codes correct?
- Will JSON response structure be consistent?
```

**6. Test with curl**
```bash
# Test happy path
curl -X POST http://localhost:3000/api/resources \
  -H "Content-Type: application/json" \
  -d '{"resource": {"name": "test"}}'

# Test error case
curl -X POST http://localhost:3000/api/resources \
  -H "Content-Type: application/json" \
  -d '{"resource": {"invalid": "data"}}'

# Test not found
curl http://localhost:3000/api/resources/99999
```

**7. Commit After Each Major Endpoint Group**
```bash
git add .
git commit -m "Add [Resource] controller with CRUD endpoints"
```

**Time checkpoint (50 min mark):**
```
[Quick check]:
✅ All required endpoints implemented?
✅ Tested manually with curl?
✅ Proper status codes?
✅ JSON responses working?

[If behind]: Simplify remaining endpoints, focus on core CRUD.
[If on track]: Continue to serialization.
```

### Part E: JSON Serialization & Error Handling (15 minutes)

**1. Decide on Serialization Approach**

Based on Claude's analysis, you likely chose one of:
- Custom serializer classes (fastest, most control)
- Jbuilder views (more conventional)
- Serializer gem (if PRD mentions it or you're very comfortable)

**For Custom Serializers (Recommended for speed):**

```
I need consistent JSON responses for my [Resource] API.

Create a custom serializer in app/serializers/resource_serializer.rb that:
- Returns: [list fields from your requirements]
- Formats dates as ISO8601
- Includes any computed fields: [list computed fields]
- Handles nil values appropriately

Keep it simple - just a PORO with an as_json method.
```

**2. Implement Error Handling**

```
Add comprehensive error handling to ApplicationController:

rescue_from ActiveRecord::RecordNotFound → 404 with message
rescue_from ActiveRecord::RecordInvalid → 422 with validation details
rescue_from ActionController::ParameterMissing → 400 with message

JSON error format should be:
{
  "error": "Human-readable message",
  "details": {...} // optional, for validation errors
}

Generate the rescue_from handlers.
```

**3. Review Error Responses**
```
Review my error handling:
- Are all common Rails errors caught?
- Is the JSON format consistent?
- Are status codes appropriate?
- Will frontend/API consumers get useful error messages?
```

**4. Test Error Cases**
```bash
# Not found
curl http://localhost:3000/api/resources/99999
# Should return 404 with JSON error

# Invalid data
curl -X POST http://localhost:3000/api/resources \
  -H "Content-Type: application/json" \
  -d '{"resource": {}}'
# Should return 422 with validation details

# Missing params
curl -X POST http://localhost:3000/api/resources \
  -H "Content-Type: application/json" \
  -d '{}'
# Should return 400 or 422
```

**5. Commit**
```bash
git add .
git commit -m "Add JSON serialization and comprehensive error handling"
```

**Time checkpoint (65 min mark):**
```
[Quick check]:
✅ JSON responses consistent?
✅ Error handling working?
✅ All endpoints returning proper formats?

[If behind]: Move to tests, skip additional polish.
[If on track]: Continue to tests.
```

### Part F: Tests (25 minutes)

**1. Determine Testing Focus**

Based on Claude's recommendation:

```
I need tests for my Rails API. 

Focus on:
- Controller/Request tests (PRIORITY for APIs)
- Model validation tests (quick wins)
- Model association tests (quick wins)
- Custom model method tests (if time)

Generate tests using [RSpec/Minitest - check what base app uses].

Start with controller tests for [Resource].
```

**2. Controller/Request Tests**

```
Generate request tests for my [Resource] API:

For GET /api/resources:
- Returns 200 with all resources
- Returns empty array when no resources
- JSON structure matches serializer

For POST /api/resources:
- With valid params: creates resource, returns 201, correct JSON
- With invalid params: returns 422 with error details
- With missing params: returns 400

For GET /api/resources/:id:
- With valid id: returns 200 with resource
- With invalid id: returns 404 with error

[Add other endpoints as needed]

Focus on status codes and JSON structure - that's what matters for an API.
```

**3. Model Tests (Faster)**

```
Generate model tests for [ModelName]:

Validations:
- Test each validation (presence, format, range, etc.)
- Test edge cases of validations

Associations:
- Test [belongs_to] association exists
- Test [has_many] association exists

Custom methods (if you have them):
- Test [method_name] with happy path
- Test [method_name] with edge cases

Keep these tests simple and focused.
```

**4. Run Tests Frequently**
```bash
# Run all tests
rspec  # or rails test

# Run specific test file
rspec spec/requests/api/resources_spec.rb

# Run specific test
rspec spec/requests/api/resources_spec.rb:10
```

**5. Fix Failures**
```
[If tests fail]:

These tests are failing:
[paste error output]

Help me identify:
- Is it a test issue or implementation issue?
- What's the quickest fix?
- Should I adjust the test or the code?
```

**6. Commit**
```bash
git add .
git commit -m "Add comprehensive test coverage for API"
```

**Time checkpoint (90 min mark - CRITICAL):**
```
[CRITICAL CHECKPOINT]:
✅ All tests passing?
✅ Core functionality working?
✅ API endpoints tested?

[If significantly behind]:
  → Go to Claude: "I'm at 90 min with [remaining work]. Triage plan?"
  → Focus on making what you have work perfectly
  → Document what you'd add with more time in README

[If on track]:
  → Continue to manual testing and polish
```

### Part G: Manual End-to-End Testing (10 minutes)

**Comprehensive Manual Test Checklist:**

```bash
# Start server
rails s

# Test each requirement from PRD:

☐ Requirement 1: [test specific functionality]
  curl [command to test]
  Expected: [what should happen]
  Actual: [verify it works]

☐ Requirement 2: [test specific functionality]
  curl [command to test]
  Expected: [what should happen]
  Actual: [verify it works]

# Test edge cases from your analysis:

☐ Edge case 1: [specific test]
  curl [command]
  Should handle gracefully with [expected behavior]

☐ Edge case 2: [specific test]
  curl [command]
  Should handle gracefully with [expected behavior]

# Test error scenarios:

☐ Invalid data
☐ Not found resources
☐ Missing required fields
☐ Out of range values
```

**If you find issues:**
```
[To Cursor]:

Found an issue during manual testing:

What I tested: [specific action]
Expected: [what should happen]
Actual: [what actually happened]
Error (if any): [paste error]

Help me fix this quickly. Root cause and solution?
```

### Part H: README & Documentation (10 minutes)

**Generate Comprehensive README:**

```
Generate a README.md for this Rails API assessment.

Include:

## Setup
- Installation steps (bundle install, db commands)
- How to run the server
- How to run tests

## API Endpoints
Document each endpoint:
- HTTP method and path
- Purpose
- Request body format (if applicable)
- Response format
- Status codes

## Architecture Decisions
- [Your serialization approach and why]
- [Whether you used service objects and why/why not]
- [Any other notable technical decisions]

## Edge Cases Handled
- [List the edge cases you handled]

## Assumptions
- [List assumptions you made about ambiguous requirements]

## Testing Approach
- What types of tests you wrote
- Coverage focus (why you prioritized certain tests)

Keep the total under 300 words but be complete and clear.
```

**Review README:**
```
Review this README:
- Are setup instructions complete and correct?
- Is API documentation clear for someone new to the project?
- Did I explain my technical decisions?
- Are assumptions documented?
```

**Commit:**
```bash
git add .
git commit -m "Add comprehensive README with setup and API documentation"
```

### Part I: Final Polish & Cleanup (5 minutes)

**Final Review with Cursor:**

```
I'm about to submit. Do a final comprehensive review:

CODE QUALITY:
- Any debugging code left behind? (binding.pry, debugger, puts statements)
- Any violations of Rails best practices?
- Any security concerns (mass assignment, etc.)?
- Does everything follow my .cursorrules?

REQUIREMENTS:
- Does my implementation cover all MUST-HAVE requirements from the PRD?
- Any obvious features missing?
- Are all edge cases from the PRD handled?

TESTS:
- Do all tests pass?
- Is test coverage adequate for core functionality?

API DESIGN:
- Are responses consistent?
- Are status codes correct?
- Is error handling comprehensive?

COMMITS:
- Are commit messages clear?
- Any commits I should squash or clean up?

Be honest and critical—what would you flag in a code review?
```

**Quick Cleanup:**

```bash
# Remove debugging code
grep -r "binding.pry" app/
grep -r "debugger" app/
grep -r "puts " app/ | grep -v "test"

# Check test status
rspec  # or rails test

# Verify migrations
rails db:migrate:status

# Check routes
rails routes | grep api
```

**Final Commit:**
```bash
git add .
git commit -m "Final cleanup and polish"
```

---

## Phase 3: Strategic Decision Points

### Decision Point 1: Service Objects vs Model Methods?

**When to Ask Claude (not Cursor):**

If the PRD has complex business logic, go to Claude:

```
The PRD requires [specific complex logic].

This could go in:
1. Model method (simple, fewer files)
2. Service object (more testable, SRP)

Given:
- Time constraint: [X] minutes remaining
- Complexity: [describe the logic]
- Will need to test it: [yes/no]

Which approach shows better Rails knowledge while being fastest to implement?
```

**Then tell Cursor:**
```
I'm choosing [approach] because [reason from Claude].
Generate the implementation for [specific thing].
```

### Decision Point 2: Serialization Strategy?

**Ask Claude upfront:**
```
For Rails API JSON responses, I could use:
1. Custom serializer PORO (fastest, most control)
2. Jbuilder (conventional)
3. fast_jsonapi gem (more setup)

Given:
- 3-hour time limit
- Need consistent JSON structure
- [Number of] models to serialize

What's the best balance of speed and showing good API design?
```

**Then tell Cursor:**
```
I'm using [chosen approach] for serialization because [reason].
Generate a [serializer/jbuilder] for [Model] that returns [fields].
```

### Decision Point 3: Testing Strategy?

**Ask Claude:**
```
For a [2-3] hour Rails API assessment, where should I focus testing?

Options:
1. Heavy controller/request tests, light model tests
2. Balanced model and controller tests
3. Just happy path tests to show I can write tests

I have [X] minutes for testing.
What shows competence without over-engineering?
```

**Then tell Cursor:**
```
Based on time constraints, I'm focusing on:
- [Test priority 1]
- [Test priority 2]
- [Will skip: X]

Generate tests for [priority 1] first.
```

---

## Time Management: The [2-3] Hour Breakdown

### For 3-Hour Assessment:

```
0:00 - 0:10   Claude planning and PRD analysis
0:10 - 0:15   Setup Rails app, initial commit
0:15 - 0:40   Models & migrations (all models)
0:40 - 1:05   Controllers & routes (all endpoints)
1:05 - 1:20   Serialization & error handling
1:20 - 1:45   Tests (controller priority)
1:45 - 1:55   Manual end-to-end testing
1:55 - 2:05   README documentation
2:05 - 2:10   Final review and cleanup
2:10 - 2:15   Submit (45-min buffer for issues)
```

### For 2-Hour Assessment:

```
0:00 - 0:10   Claude planning (critical)
0:10 - 0:15   Setup Rails app
0:15 - 0:35   Models & migrations (focus on essentials)
0:35 - 0:55   Controllers & routes (core CRUD only)
0:55 - 1:05   Error handling (skip custom serializers if tight)
1:05 - 1:25   Tests (happy path + 1-2 error cases)
1:25 - 1:30   Manual testing (quick verification)
1:30 - 1:35   README (brief but complete)
1:35 - 1:40   Final cleanup
1:40 - 2:00   Buffer for issues
```

### Critical Checkpoints:

**At 25% time (45min for 3hr / 30min for 2hr):**
```
[Check with yourself]:
Should have: Models complete, migrations run
Actual: [what you have]

[If behind → Quick Claude consult]:
"I'm 25% through time, only have [X] done. Should I simplify data model or push forward?"
```

**At 50% time (90min for 3hr / 60min for 2hr):**
```
[CRITICAL CHECKPOINT]:
Should have: Models + Controllers mostly done
Actual: [what you have]

[If significantly behind]:
  → Claude: "At halfway point with [status]. Triage strategy?"
  → Cut nice-to-haves
  → Simplify what remains
  → Focus on working core features

[If on track]:
  → Continue as planned
  → Maybe add one nice-to-have if time
```

**At 75% time (135min for 3hr / 90min for 2hr):**
```
[Check]:
Should have: Everything working, starting polish
Actual: [what you have]

[If behind]:
  → Skip additional tests
  → Minimal README
  → Just get it working

[If on track]:
  → Comprehensive tests
  → Good README
  → Final polish
```

---

## Common Rails-Specific Pitfalls

### Pitfall 1: Over-Architecting

**❌ Don't:**
- Build service objects for simple CRUD
- Create elaborate decorator patterns
- Build features not in the PRD
- Implement pagination if not required

**✅ Do:**
- Keep it simple: models → controllers → tests
- Add service objects only for genuinely complex logic
- Build exactly what's asked
- Document what you'd add with more time

**When in doubt, ask Claude:**
```
The PRD requires [X]. I'm considering [complex solution].

Is this over-engineering for a [2-3] hour assessment, or does it show good Rails knowledge?
What's the simplest solution that still shows competence?
```

### Pitfall 2: Weak Error Handling

**❌ Common mistake:**
```ruby
def create
  @resource = Resource.create(resource_params)
  render json: @resource
end
```
No status codes, no error handling.

**✅ Better:**
```ruby
def create
  @resource = Resource.new(resource_params)
  if @resource.save
    render json: ResourceSerializer.new(@resource).as_json, status: :created
  else
    render json: { error: 'Validation failed', details: @resource.errors }, 
           status: :unprocessable_entity
  end
end
```

**Ask Cursor to review:**
```
Review my controller actions for error handling:
- Are all error cases handled?
- Are status codes appropriate?
- Is the JSON error format consistent?
- What edge cases am I missing?
```

### Pitfall 3: Inconsistent JSON Responses

**❌ Don't:**
```ruby
# In one action:
render json: @resource

# In another action:
render json: { data: @resource }

# In error:
render json: { message: 'error' }
```

**✅ Do:**
- Use consistent serialization everywhere
- Consistent error format everywhere
- Document your JSON structure

**Verify with Cursor:**
```
Review my API responses for consistency:
- Do all success responses use the same format?
- Do all error responses use the same format?
- Are field names consistent (camelCase vs snake_case)?
```

### Pitfall 4: Missing Indexes

**❌ Don't:**
```ruby
# Migration without indexes
create_table :posts do |t|
  t.references :user  # Foreign key but no index!
  t.string :title
end
```

**✅ Do:**
```ruby
create_table :posts do |t|
  t.references :user, foreign_key: true, index: true
  t.string :title
  t.timestamps
end

add_index :posts, :title  # If searching by title
```

**Ask Cursor:**
```
Review my migrations:
- Do all foreign keys have indexes?
- Are there any fields I'll query on that need indexes?
- Any missing constraints?
```

### Pitfall 5: Not Testing the API Contract

**❌ Don't:**
Just test that code runs:
```ruby
it 'creates a post' do
  post '/api/posts', params: { post: { title: 'Test' } }
  expect(response).to be_successful
end
```

**✅ Do:**
Test the actual API contract:
```ruby
it 'creates a post and returns correct JSON structure' do
  post '/api/posts', params: { post: { title: 'Test' } }
  
  expect(response).to have_http_status(:created)
  json = JSON.parse(response.body)
  expect(json).to include('id', 'title', 'created_at')
  expect(json['title']).to eq('Test')
end
```

**Ask Cursor:**
```
Review my API tests:
- Am I testing actual JSON structure, not just success/failure?
- Am I testing status codes explicitly?
- Do my tests verify the API contract?
```

---

## Emergency Scenarios

### Emergency 1: Behind Schedule at 90 Minutes

**Immediate action - Go to Claude:**

```
URGENT: I'm at 90 minutes in a 3-hour Rails assessment.

Current status:
- ✅ Completed: [list what you have]
- ❌ Remaining: [list what's left]
- Time left: 90 minutes

What's the minimum viable implementation to show Rails competence?
What should I:
1. Complete fully
2. Simplify significantly  
3. Skip entirely and document as "future enhancement"

Be ruthless about triage.
```

**Then execute Claude's plan with Cursor:**
```
Changing strategy due to time constraints.

New plan:
- [Simplified feature 1]
- [Skip feature 2 - document in README]
- [Bare minimum feature 3]

Generate the simplest working implementation of [feature 1].
Focus on working code over perfect code.
```

### Emergency 2: Tests Failing 20 Minutes Before Deadline

**Quick decision with Claude:**

```
20 minutes to deadline. Tests failing:
[paste key errors]

Should I:
1. Try to fix quickly
2. Comment out failing tests and explain in README
3. Submit with failing tests
4. Skip tests entirely and focus on working API

What's the least-bad option?
```

**Then execute:**
```
[If fixing]:
Cursor, these tests are failing: [errors]
Quickest fix that works?

[If commenting out]:
I'm commenting out these tests due to time constraints.
Help me add a note in README explaining:
- What's not tested
- What the issue is
- How I'd fix it with more time
```

### Emergency 3: Can't Get Something Working

**After 15 minutes stuck - go to Claude:**

```
I've been stuck for 15 minutes on [problem].

What I'm trying: [X]
What's happening: [Y]
Error: [Z]
Time remaining: [minutes]

Should I:
1. Keep trying to fix
2. Implement a simpler workaround
3. Skip this feature
4. Something else

What's the most pragmatic approach?
```

**Then to Cursor with clear directive:**
```
I'm implementing [workaround] instead because [reason].

Generate [simpler solution].
I'll document this as a simplification in README.
```

### Emergency 4: Completely Stuck on Architecture Decision

**Go to Claude (5-minute consult max):**

```
Quick architectural question:

The PRD requires [feature] which could be:
A) [Approach A] - [pros/cons]
B) [Approach B] - [pros/cons]

Time remaining: [X] minutes
Current progress: [Y]

Which approach gets me to working code fastest while showing Rails competence?
```

**Then execute immediately:**
```
[To Cursor]:
I'm going with [chosen approach] because [reason].
Generate the implementation.
```

---

## What Excellent Looks Like (In Your Cursor Logs)

### Strong Opening

```
✅ "I'm building a Rails API for [purpose]. I've analyzed the requirements:

CORE FEATURES:
- [Specific feature 1]
- [Specific feature 2]

DATA MODEL:
- [Model breakdown]

API ENDPOINTS:
- [Endpoint list]

MY APPROACH:
- [Technical decisions]

Let's start with models. Generate migration for [Model] with [specs]."
```

### Good Technical Dialogue

```
✅ "You suggested [X]. I'm considering [Y] instead because:
    - [Reason 1]
    - [Reason 2]
    What are the tradeoffs for a 3-hour assessment?"

✅ "For [requirement], should I use a service object or model method?
    The logic is [X]. Given time constraints, what shows better Rails knowledge?"

✅ "Review this implementation before I move on:
    - Edge cases handled?
    - Rails anti-patterns?
    - Performance concerns?"
```

### Time Awareness

```
✅ "I'm 60 minutes in. Checkpointing:
    - ✅ Models complete
    - ✅ 3/5 endpoints done
    - On track for my plan. Continuing..."

✅ "90 minutes in, running behind. Simplifying [feature] to get working API.
    Will document full implementation as future work."
```

### Quality Consciousness

```
✅ "Final review before submission:
    - Any obvious bugs?
    - Any Rails anti-patterns?
    - Any security issues?
    - Would this pass a senior developer's code review?"
```

---

## What Poor Looks Like (Avoid This)

### Weak Opening

```
❌ "Here's the PRD: [paste]
    What should I build?"
```

### No Independent Thinking

```
❌ [Cursor suggests X]
❌ [User: "OK"]
❌ [Implements without questioning]
```

### No Time Management

```
❌ [No checkpoints mentioned]
❌ [Discovers at 2:45 they haven't started tests]
```

### No Quality Checks

```
❌ [Generates all code]
❌ [Never asks for review]
❌ [Submits without verification]
```

---

## Using Claude Throughout (Quick Reference)

### When to Consult Claude:

**Planning Phase (10-15 min):**
- ✅ Initial PRD analysis
- ✅ Technical architecture
- ✅ Time allocation
- ✅ Edge case identification

**During Implementation (2-3 min quick consults):**
- ✅ Stuck for 10+ minutes
- ✅ Major architectural decision
- ✅ Behind schedule (need triage)
- ✅ Unsure about Rails best practice

**Don't Consult Claude For:**
- ❌ Syntax questions (ask Cursor)
- ❌ How to implement specific code (ask Cursor)
- ❌ Debugging specific errors (ask Cursor first)
- ❌ Every small decision (trust your judgment)

### Claude Consultation Template:

```
[Quick context]
Issue: [specific problem]
Time remaining: [X] minutes
Current status: [where you are]

Question: [specific question]

Need: Quick, pragmatic advice for assessment context.
```

---

## Pre-Submission Checklist

**With 15 Minutes Left:**

### Code Quality Check:

```bash
☐ Remove debugging code
  grep -r "binding.pry" app/
  grep -r "debugger" app/
  grep -r "puts " app/ | grep -v test

☐ All tests pass
  rspec  # or rails test

☐ Migrations are clean
  rails db:migrate:status

☐ Routes are correct
  rails routes | grep api
```

### Functionality Check:

```bash
☐ Start fresh Rails server
  rails s

☐ Test each requirement from PRD manually
  curl [test each endpoint]

☐ Test error cases
  curl [test invalid data]
  curl [test not found]

☐ Verify JSON responses
  Check structure, status codes
```

### Documentation Check:

```
☐ README has:
  - Setup instructions
  - API endpoint documentation
  - Technical decisions explained
  - Assumptions listed

☐ Code comments (if needed):
  - Complex logic explained
  - Tradeoffs documented

☐ Git commits:
  - Meaningful commit messages
  - Logical progression
```

### Final Cursor Review:

```
I'm submitting in 10 minutes. Final check:

BLOCKERS:
- Anything that would prevent the API from working?
- Any obvious bugs?
- Any errors I missed?

EMBARRASSING ISSUES:
- Debugging code left in?
- Rails anti-patterns?
- Security issues?

REQUIREMENTS:
- All must-haves covered?
- Edge cases handled?

Be brutally honest - what would fail a senior review?
```

---

## Post-Submission Reflection

After submitting, document for future assessments:

### What Worked Well:
- Which Claude insights were most valuable?
- Where did the two-tool approach save time?
- What technical decisions were correct?

### What Could Improve:
- Where did I lose time unnecessarily?
- What would I do differently?
- What did I over/under-engineer?

### Claude Effectiveness:
- Was the initial time allocation accurate?
- Did Claude spot issues I missed?
- Were architectural recommendations correct?

### Cursor Effectiveness:
- Where did Cursor save the most time?
- Where did suggestions need modification?
- Did my prompting improve throughout?

### For Next Time:
- Adjust time allocations based on learning
- Note common pitfalls to avoid
- Refine your planning process

---

## Key Principles to Remember

### 1. Claude = Strategy, Cursor = Tactics
- Use Claude for "why" and "what"
- Use Cursor for "how"
- Don't blur the lines

### 2. You're the Senior Engineer
- Both tools advise, you decide
- Show your reasoning in Cursor logs
- Your judgment is being evaluated

### 3. Working > Perfect
- Tested, working code > incomplete perfection
- Simple solutions > complex architectures
- Done > perfect

### 4. Time-Box Ruthlessly
- Every phase has a limit
- Move on when time's up
- Cut scope, not quality

### 5. Test the API Contract
- Status codes matter
- JSON structure matters
- Error responses matter
- Don't just test that code runs

### 6. Show Your Process
- Document decisions
- Explain tradeoffs
- Demonstrate reasoning
- Make thinking visible

---

## Rails-Specific Best Practices

### Keep Controllers Thin
```ruby
# ❌ Fat controller
def create
  @post = Post.new(post_params)
  @post.user = current_user
  @post.slug = @post.title.parameterize
  @post.published_at = Time.current if @post.published?
  # ... 10 more lines
end

# ✅ Thin controller
def create
  @post = Post.create_for_user(current_user, post_params)
  # Logic in model or service
end
```

### Use Strong Parameters
```ruby
# ✅ Always use strong parameters
def post_params
  params.require(:post).permit(:title, :body, :published)
end
```

### Proper Status Codes
```ruby
# ✅ Use semantic status codes
render json: @post, status: :created       # 201
render json: @post, status: :ok            # 200
render json: errors, status: :unprocessable_entity  # 422
render json: error, status: :not_found     # 404
```

### Consistent JSON Structure
```ruby
# ✅ Always use serializers
render json: PostSerializer.new(@post).as_json

# ✅ Consistent error format
render json: { error: msg, details: details }
```

### Index Foreign Keys
```ruby
# ✅ Always index foreign keys
t.references :user, foreign_key: true, index: true
```

---

## Final Wisdom

### You've Got This Because:

1. **You have 3 years Rails experience** - Trust your instincts
2. **You have a strategic approach** - Planning beats panic
3. **You have the right tools** - Claude + Cursor is powerful
4. **You understand the game** - They're evaluating judgment, not just code

### Remember:

- **10-15 min Claude planning** → Worth every second
- **Show your thinking** → Make reasoning visible in Cursor logs
- **Time-box everything** → Move on when time's up
- **Working beats perfect** → Done > incomplete
- **Test the contract** → APIs are about interfaces
- **You're in control** → Tools advise, you decide

### When in Doubt:

1. Would a senior Rails dev approve this?
2. Does it work reliably?
3. Is it tested?
4. Can someone else understand it?

If yes to all four → Ship it.

---

**Good luck! You've got a killer strategy. Go crush this assessment.** 🚀
