# Full-Stack Take-Home Assessment Guide
## React/TypeScript Frontend + Rails API Backend

## Pre-Assessment Setup (Do This Now)

### 1. Environment Check

```bash
# Verify your Ruby version
ruby -v

# Verify Rails installation
rails -v

# Verify Node/npm versions
node -v
npm -v

# Verify you can run both servers
# (Rails on 3000, React on 3001 typically)
```

### 2. Cursor Setup

- ✅ Cursor updated to latest version
- ✅ AI features enabled and working
- ✅ Your existing `.cursorrules` file ready to copy into project root
- ✅ Comfortable with Cursor's chat interface
- ✅ Know how to switch between frontend/backend context

### 3. Mental Preparation

- ✅ Block 3-hour uninterrupted time window
- ✅ Water/coffee ready
- ✅ Not tired or distracted
- ✅ Review this guide one more time

---

## Phase 1: Initial Setup (15 minutes)

### When You Receive the PRD Email

**Step 1: Understand the Architecture**

Most full-stack take-homes will be:
- **Option A**: Separate repos (Rails API + React SPA)
- **Option B**: Monorepo (Rails app with React in `/client` or `/frontend`)

Check which you have and plan accordingly.

**Step 2: Get Both Servers Running**

```bash
# If separate repos:
cd rails-api
bundle install
rails db:create db:migrate db:seed
rails s  # Should run on port 3000

# In another terminal:
cd react-frontend
npm install
npm start  # Should run on port 3001

# If monorepo:
bundle install
rails db:create db:migrate db:seed
cd client  # or frontend
npm install
# Check package.json for proxy settings to Rails API
npm start
```

**Step 3: Copy Your .cursorrules**

```bash
# In the Rails directory
cp /path/to/your/.cursorrules .cursorrules

# If separate frontend repo, copy there too
cd ../react-frontend
cp /path/to/your/.cursorrules .cursorrules
```

**Step 4: Verify Everything Works**

```bash
# Test Rails API
curl http://localhost:3000/api/some_endpoint

# Visit React app in browser
open http://localhost:3001

# Verify they can talk to each other
# (React should be able to fetch from Rails)
```

**Step 5: Read the PRD Thoroughly**
- Read it twice, completely
- Identify **MUST HAVE** requirements (both frontend and backend)
- Identify nice-to-haves
- Note any ambiguities or questions
- **Critical**: Understand what they care about more—API design or UI polish?

**Step 6: Initial Git Commits** (if not already repos)

```bash
# In Rails directory
git init
git add .
git commit -m "Initial commit - base Rails API"

# In React directory
git init
git add .
git commit -m "Initial commit - base React app"
```

---

## Phase 2: Planning with Cursor (15 minutes)

### Open Cursor and Start Your First Interaction

**Prompt #1: Get the Full-Stack Implementation Plan**

```
I'm working on a full-stack take-home assessment with React/TypeScript frontend and Rails API backend.

Here's the PRD:
[PASTE ENTIRE PRD]

Based on this PRD and my .cursorrules file, help me:
1. Identify all core requirements (must-haves for both frontend and backend)
2. Suggest the technical architecture:
   - Rails: models, controllers, routes, serializers
   - React: components, API service layer, state management
3. List potential edge cases to handle on both sides
4. Provide a time-boxed implementation plan for the next 2.5 hours

I have 3 years experience with Rails and strong TypeScript/React skills, so be concise.
```

**Review Cursor's Response and Ask Follow-ups:**

```
Good plan. A few questions:
- Should I use a state management library (Context, Zustand) or is React state sufficient?
- For the Rails API, should I use serializers (fast_jsonapi, AMS) or just render json?
- What's the priority—API functionality first, or should I build them in parallel?
- Any specific UI concerns from the PRD I should prioritize?
```

**Create Your Task List** (in your head or on paper):

```
BACKEND (90 min):
☐ Models & migrations (25 min)
☐ Controllers & routes (20 min)
☐ Serializers/JSON responses (15 min)
☐ Error handling (10 min)
☐ Backend tests (20 min)

FRONTEND (60 min):
☐ API service layer with TypeScript types (15 min)
☐ Core components (30 min)
☐ Error/loading states (10 min)
☐ Frontend tests (optional if time permits)

INTEGRATION & POLISH (30 min):
☐ End-to-end manual testing (15 min)
☐ README & documentation (10 min)
☐ Final cleanup (5 min)
```

**Key Decision: Backend-First or Parallel?**

Most efficient approach:
1. **Backend first** (get API working completely)
2. **Then frontend** (consume the known-good API)
3. **Then integration testing**

This avoids debugging "is it frontend or backend?" issues.

---

## Phase 3: Implementation - Backend (90 minutes)

### Part A: Models & Database (25 min)

**Prompt to Cursor (in Rails directory):**

```
Let's start with the Rails API data model. Based on the requirements, generate:
1. The necessary models with appropriate associations
2. Database migrations with proper indexes and constraints
3. Basic model validations
4. Any custom model methods needed

Show me each migration separately so I can review them.
```

**Review Each Migration:**
- Check column types (especially for data coming from/going to frontend)
- Verify indexes on foreign keys
- Ensure constraints match business rules
- Make sure migrations are reversible

**Generate and Review:**

```bash
# Let Cursor generate the commands, then run them
rails g model [ModelName] [attributes]

# Review the migration file before running
rails db:migrate

# Test in console
rails c
# Create sample records to verify associations work
```

**Commit:**

```bash
git add .
git commit -m "Add [Model] with associations and validations"
```

---

### Part B: Controllers & Routes (20 min)

**Prompt to Cursor:**

```
Now let's implement the API controllers. Based on the PRD requirements:
1. Show me the routes we need in routes.rb (RESTful API structure)
2. Generate the controller with the necessary actions
3. Each action should:
   - Handle success and failure cases
   - Use proper HTTP status codes
   - Return JSON responses
   - Handle CORS if needed

Start with routes.rb
```

**Review Routes:**
- RESTful conventions followed?
- API namespaced properly? (`namespace :api do`)
- All required endpoints covered?
- Proper HTTP verbs (GET, POST, PATCH, DELETE)?

**Generate Controller:**

```
Generate the Api::[Resource]Controller with these actions:
- [list actions from PRD]

For each action:
- Keep it under 10 lines
- Extract complex logic to service objects if needed
- Handle errors with appropriate status codes and JSON messages
- Use strong parameters
```

**Review Controller Code:**
- Actions are thin?
- Strong parameters defined?
- Error handling present?
- JSON responses structured consistently?
- Status codes correct? (200, 201, 404, 422, etc.)

**Test Each Endpoint Manually:**

```bash
# Use curl or Postman

# GET request
curl http://localhost:3000/api/resources

# POST request
curl -X POST http://localhost:3000/api/resources \
  -H "Content-Type: application/json" \
  -d '{"key": "value"}'

# Error case
curl -X POST http://localhost:3000/api/resources \
  -H "Content-Type: application/json" \
  -d '{"invalid": "data"}'
```

**Commit:**

```bash
git add .
git commit -m "Add Api::[Resource] controller with CRUD operations"
```

---

### Part C: Serializers/JSON Responses (15 min)

**Why This Matters for Full-Stack:**
Frontend needs **consistent, predictable JSON structure**. Don't just `render json: @resource`.

**Prompt to Cursor:**

```
I need consistent JSON responses for my API. Should I use:
1. A serializer gem (fast_jsonapi, active_model_serializers)
2. Jbuilder views
3. Custom serializers

Given this is a 3-hour take-home, recommend the simplest approach that still shows good API design.

For [Resource], I need to return:
- [list fields from PRD]
- [any computed fields]
- [any nested associations]
```

**Options by Speed:**

**Fastest - Custom serializer (10 min):**
```ruby
# app/serializers/resource_serializer.rb
class ResourceSerializer
  def initialize(resource)
    @resource = resource
  end

  def as_json
    {
      id: @resource.id,
      name: @resource.name,
      created_at: @resource.created_at.iso8601,
      # ... other fields
    }
  end
end

# In controller:
render json: ResourceSerializer.new(@resource).as_json
```

**Medium - Jbuilder (15 min):**
```ruby
# app/views/api/resources/show.json.jbuilder
json.id @resource.id
json.name @resource.name
json.created_at @resource.created_at

# In controller:
render :show
```

**Slower - Serializer gem (20 min):**
Only if PRD explicitly mentions it or you're very comfortable with it.

**Pick the fastest option that works.** You have a frontend to build.

**Commit:**

```bash
git add .
git commit -m "Add JSON serialization for API responses"
```

---

### Part D: Error Handling (10 min)

**Prompt to Cursor:**

```
Add comprehensive error handling to my API controllers:
1. Standard Rails error handling for ActiveRecord errors
2. Custom error responses with consistent JSON structure
3. Proper HTTP status codes

Error response format should be:
{
  "error": "Human-readable message",
  "details": {} // optional additional context
}
```

**Add to ApplicationController:**

```ruby
class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  rescue_from ActionController::ParameterMissing, with: :bad_request

  private

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def unprocessable_entity(exception)
    render json: { 
      error: exception.message,
      details: exception.record.errors.messages
    }, status: :unprocessable_entity
  end

  def bad_request(exception)
    render json: { error: exception.message }, status: :bad_request
  end
end
```

**Test Error Cases:**

```bash
# Not found
curl http://localhost:3000/api/resources/99999

# Invalid data
curl -X POST http://localhost:3000/api/resources \
  -H "Content-Type: application/json" \
  -d '{"invalid": "data"}'
```

**Commit:**

```bash
git add .
git commit -m "Add comprehensive error handling to API"
```

---

### Part E: Backend Tests (20 min)

**Prompt to Cursor:**

```
Generate tests for my Rails API. I need:

For Models:
- Validation tests
- Association tests
- Any custom method tests

For Controllers (this is critical for an API):
- Happy path tests for each endpoint
- Error case tests (invalid data, not found, etc)
- Verify JSON response structure
- Verify correct HTTP status codes

Use [RSpec/Minitest - check what the base app uses]
Focus on controller tests—that's what matters for an API.
```

**Priority: Controller/Request Tests**

For a full-stack take-home, **API tests matter more than model tests**. Frontend depends on API working correctly.

**Key things to test:**
```ruby
# Example with RSpec
describe 'GET /api/resources' do
  it 'returns all resources' do
    create_list(:resource, 3)
    get '/api/resources'
    
    expect(response).to have_http_status(:ok)
    json = JSON.parse(response.body)
    expect(json.length).to eq(3)
  end
end

describe 'POST /api/resources' do
  context 'with valid params' do
    it 'creates a resource' do
      post '/api/resources', params: { resource: valid_params }
      
      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(json['name']).to eq(valid_params[:name])
    end
  end

  context 'with invalid params' do
    it 'returns error' do
      post '/api/resources', params: { resource: invalid_params }
      
      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body)
      expect(json).to have_key('error')
    end
  end
end
```

**Run Tests:**

```bash
# For RSpec
rspec

# For Minitest
rails test

# Run specific test files as you create them
rspec spec/requests/api/resources_spec.rb
```

**If Tests Fail:**

```
These tests are failing: [paste error]
Help me fix the issue. Is it the test or the implementation?
```

**Commit:**

```bash
git add .
git commit -m "Add comprehensive API tests"
```

**Backend Checkpoint (90 min mark):**

Before moving to frontend, verify:
- ✅ All API endpoints work via curl/Postman
- ✅ Error cases return proper JSON and status codes
- ✅ Tests pass
- ✅ JSON responses are clean and consistent

If you're behind, **skip some model tests** but keep API tests. Frontend needs a working API.

---

## Phase 4: Implementation - Frontend (60 minutes)

### Part A: API Service Layer with TypeScript (15 min)

**Critical First Step: Define your API contract in TypeScript**

**Prompt to Cursor (in React directory):**

```
I need to create an API service layer for my React app that calls my Rails backend at http://localhost:3000.

Based on my Rails API that has these endpoints:
- [list your endpoints]

Create:
1. TypeScript interfaces for all request/response types
2. An API service file with methods for each endpoint
3. Proper error handling
4. Loading states consideration

Put this in src/services/api.ts
```

**What You Should Get:**

```typescript
// src/types/api.ts
export interface Resource {
  id: number;
  name: string;
  createdAt: string;
  // ... other fields matching your Rails serializer
}

export interface CreateResourceRequest {
  name: string;
  // ... other fields
}

export interface ApiError {
  error: string;
  details?: Record<string, string[]>;
}

// src/services/api.ts
const API_BASE_URL = 'http://localhost:3000/api';

export const api = {
  async getResources(): Promise<Resource[]> {
    const response = await fetch(`${API_BASE_URL}/resources`);
    if (!response.ok) {
      const error: ApiError = await response.json();
      throw new Error(error.error);
    }
    return response.json();
  },

  async createResource(data: CreateResourceRequest): Promise<Resource> {
    const response = await fetch(`${API_BASE_URL}/resources`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data),
    });
    if (!response.ok) {
      const error: ApiError = await response.json();
      throw new Error(error.error);
    }
    return response.json();
  },

  // ... other methods
};
```

**Test the API Service:**

```typescript
// Quick test in browser console or a test component
import { api } from './services/api';

api.getResources()
  .then(data => console.log('Success:', data))
  .catch(error => console.error('Error:', error));
```

**Commit:**

```bash
git add .
git commit -m "Add API service layer with TypeScript types"
```

---

### Part B: Core Components (30 min)

**Understand What You're Building:**

Most full-stack PRDs will ask for:
- A list/index view (show all items)
- A form to create/edit items
- Some kind of detail view
- Basic error/success feedback

**Prompt to Cursor:**

```
Based on the PRD requirements, I need to build these React components:
1. [List component name] - displays all resources
2. [Form component name] - creates/edits resources
3. [Detail component name] - shows single resource (if needed)

For each component:
- Use functional components with hooks
- Use TypeScript
- Handle loading and error states
- Call the API service we just created
- Keep components small and focused

Start with the list component.
```

**Component Structure Pattern:**

```typescript
// src/components/ResourceList.tsx
import React, { useEffect, useState } from 'react';
import { api } from '../services/api';
import { Resource } from '../types/api';

export const ResourceList: React.FC = () => {
  const [resources, setResources] = useState<Resource[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    loadResources();
  }, []);

  const loadResources = async () => {
    try {
      setLoading(true);
      setError(null);
      const data = await api.getResources();
      setResources(data);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An error occurred');
    } finally {
      setLoading(false);
    }
  };

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <div>
      <h1>Resources</h1>
      {resources.length === 0 ? (
        <p>No resources found</p>
      ) : (
        <ul>
          {resources.map(resource => (
            <li key={resource.id}>{resource.name}</li>
          ))}
        </ul>
      )}
    </div>
  );
};
```

**Build Components Iteratively:**

1. **List component first** (10 min)
   - Get data from API
   - Display in basic list
   - Handle loading/error states

2. **Form component** (15 min)
   - Controlled inputs
   - Form validation
   - Submit to API
   - Handle success/error

3. **Wire them together** (5 min)
   - Add navigation if needed
   - Update list after creating item
   - Basic layout

**Don't Over-Style:**
- Basic CSS is fine
- Use Tailwind if already set up
- Don't spend time making it pixel-perfect
- Functionality > Aesthetics for take-homes

**Commit After Each Component:**

```bash
git add .
git commit -m "Add ResourceList component with loading/error states"

git add .
git commit -m "Add ResourceForm component with validation"
```

---

### Part C: Error/Loading States (10 min)

**This is where most candidates lose points on full-stack assessments.**

**Prompt to Cursor:**

```
Review my React components for proper error and loading state handling:
1. Are all async operations showing loading states?
2. Are all errors being caught and displayed to users?
3. Is there user feedback for successful actions?
4. Any edge cases I'm missing?

Suggest improvements.
```

**Checklist for Each Component:**
- ✅ Shows loading spinner/text while fetching
- ✅ Shows error message if fetch fails
- ✅ Shows success message after mutations
- ✅ Disables buttons during submission
- ✅ Handles empty states (no data)

**Quick Wins:**

```typescript
// Add a simple toast/message component
export const Message: React.FC<{ type: 'success' | 'error', text: string }> = ({ type, text }) => (
  <div className={`message ${type}`}>
    {text}
  </div>
);

// Use it after actions
const [message, setMessage] = useState<{ type: 'success' | 'error', text: string } | null>(null);

const handleSubmit = async (data) => {
  try {
    await api.createResource(data);
    setMessage({ type: 'success', text: 'Resource created!' });
  } catch (error) {
    setMessage({ type: 'error', text: error.message });
  }
};
```

**Commit:**

```bash
git add .
git commit -m "Add comprehensive error and loading states"
```

---

### Part D: Frontend Tests (10 min - Optional)

**Reality Check:** With 60 minutes for frontend, you probably won't have time for comprehensive frontend tests.

**If you have time:**

```
Generate basic tests for my React components:
- ResourceList renders and fetches data
- ResourceForm submits correctly
- Error states display properly

Use React Testing Library.
Keep them simple—I'm time-constrained.
```

**Minimum viable tests:**

```typescript
import { render, screen, waitFor } from '@testing-library/react';
import { ResourceList } from './ResourceList';

test('renders resources from API', async () => {
  render(<ResourceList />);
  
  expect(screen.getByText('Loading...')).toBeInTheDocument();
  
  await waitFor(() => {
    expect(screen.getByText('Resource 1')).toBeInTheDocument();
  });
});
```

**If no time:** Skip frontend tests, focus on manual testing. Backend tests + working UI > no tests + broken UI.

---

## Phase 5: Integration & Polish (30 minutes)

### Part A: End-to-End Manual Testing (15 min)

**This is critical. Test the whole flow as a user would.**

**Testing Checklist:**

```
Start both servers (Rails + React):

Terminal 1: rails s
Terminal 2: npm start (in frontend directory)

Test Happy Paths:
☐ Can I see the list of items?
☐ Can I create a new item via the form?
☐ Does the list update after creating?
☐ Can I edit an item (if applicable)?
☐ Can I delete an item (if applicable)?
☐ Can I view item details (if applicable)?

Test Error Cases:
☐ What happens if I submit invalid data?
☐ What happens if the backend is down?
☐ What happens if I try to access a non-existent item?
☐ Are error messages user-friendly?

Test Edge Cases from PRD:
☐ [Specific edge case 1]
☐ [Specific edge case 2]
☐ [Specific edge case 3]

UI/UX Check:
☐ Loading states appear during API calls?
☐ Success messages show after actions?
☐ Forms clear/reset after submission?
☐ No console errors in browser?
```

**Prompt to Cursor if Issues Found:**

```
I'm doing end-to-end testing and found this issue:
[describe the issue]

Here's what I expected vs what happened:
Expected: [...]
Actual: [...]

Help me debug this quickly.
```

**Fix critical bugs, note minor issues for README.**

---

### Part B: README & Documentation (10 min)

**You need TWO READMEs: one for backend, one for frontend.**

**Prompt to Cursor:**

```
Create a README.md for both my Rails API and React frontend that includes:

For Rails API:
1. Setup instructions
2. How to run tests
3. API endpoints documentation
4. Any architectural decisions I made

For React Frontend:
1. Setup instructions
2. How to run the app
3. Tech stack used
4. Any assumptions or tradeoffs

Keep both under 200 words each. Be concise but complete.
```

**Rails README Should Include:**

```markdown
# [Project Name] - Rails API

## Setup
```bash
bundle install
rails db:create db:migrate db:seed
rails s
```

## Running Tests
```bash
rspec  # or rails test
```

## API Endpoints
- `GET /api/resources` - List all resources
- `POST /api/resources` - Create a resource
- `GET /api/resources/:id` - Get a single resource
- `PATCH /api/resources/:id` - Update a resource
- `DELETE /api/resources/:id` - Delete a resource

## Architecture Decisions
- Used custom serializers for consistent JSON responses
- Implemented error handling at ApplicationController level
- [Any other decisions you made]

## Assumptions
- [Any assumptions you made about the requirements]
```

**React README Should Include:**

```markdown
# [Project Name] - React Frontend

## Setup
```bash
npm install
npm start
```

Runs on http://localhost:3001
Backend API should be running on http://localhost:3000

## Tech Stack
- React 18
- TypeScript
- [Any other libraries used]

## Architecture
- API calls centralized in `src/services/api.ts`
- TypeScript interfaces in `src/types/api.ts`
- [Any state management approach]

## Assumptions
- [Any assumptions you made]

## Known Issues / Future Improvements
- [Any minor bugs or things you'd improve with more time]
```

**Commit:**

```bash
# In Rails directory
git add .
git commit -m "Add comprehensive README"

# In React directory
git add .
git commit -m "Add comprehensive README"
```

---

### Part C: Final Cleanup (5 min)

**Prompt to Cursor:**

```
Do a final review of my full-stack implementation:

Rails API:
- Any debugging code left behind?
- Any violations of Rails best practices?
- Any security concerns?
- Anything that doesn't follow my .cursorrules?

React Frontend:
- Any console.logs left behind?
- Any TypeScript `any` types I should fix?
- Any unused imports or variables?
- Anything that doesn't follow my .cursorrules?

Be critical but focus on things that would be embarrassing in a code review.
```

**Quick Cleanup Commands:**

```bash
# Rails - find debugging code
grep -r "binding.pry" app/
grep -r "debugger" app/
grep -r "puts " app/ | grep -v test

# React - find debugging code
grep -r "console.log" src/
grep -r "debugger" src/

# Check for TypeScript issues
npm run type-check  # if you have this script

# Run linter
npm run lint  # if you have this script
```

**Address Critical Issues Only:**
- Remove debugging code ✅
- Fix obvious bugs ✅
- Fix TypeScript errors ✅
- Don't over-engineer at this stage ❌

**Final Commits:**

```bash
# Rails
git add .
git commit -m "Final cleanup and polish"

# React
git add .
git commit -m "Final cleanup and polish"
```

---

## Pre-Submission Checklist

### Backend Checklist:

```bash
☐ All tests pass
  rspec  # or rails test

☐ No debugging code
  grep -r "binding.pry" app/
  grep -r "puts " app/

☐ Migrations are clean
  rails db:migrate:status

☐ API works via curl/Postman
  curl http://localhost:3000/api/resources

☐ Error responses are JSON
  curl http://localhost:3000/api/resources/99999

☐ README is complete

☐ Git commits are clean
  git log --oneline
```

### Frontend Checklist:

```bash
☐ App runs without errors
  npm start

☐ No console errors in browser
  Open devtools, check console

☐ No TypeScript errors
  npm run type-check

☐ No console.logs left behind
  grep -r "console.log" src/

☐ All user flows work
  Test create, read, update, delete

☐ Loading/error states work
  Test with network tab throttled

☐ README is complete

☐ Git commits are clean
  git log --oneline
```

### Integration Checklist:

```bash
☐ Frontend can talk to backend
  
☐ CORS is configured properly (if separate origins)

☐ Data flows correctly end-to-end

☐ Error handling works across stack

☐ Edge cases from PRD are handled
```

---

## Submission Package

### What to Include:

**If Separate Repos:**
1. ✅ Rails API repository (zip or link)
2. ✅ React frontend repository (zip or link)
3. ✅ Cursor logs (if requested - screenshot/export)
4. ✅ Brief email explaining what you built

**If Monorepo:**
1. ✅ Complete repository (zip or link)
2. ✅ Cursor logs (if requested)
3. ✅ Brief email explaining what you built

### Before Hitting Send:

**Final Prompt to Cursor:**

```
I'm about to submit my full-stack assessment. Do one last check:

Rails API:
- Does everything match the PRD requirements?
- Are there any obvious bugs?
- Did I follow Rails best practices?
- Is the README clear?

React Frontend:
- Does everything match the PRD requirements?
- Are there any obvious bugs?
- Did I follow React/TypeScript best practices?
- Is the README clear?

Integration:
- Does the frontend properly consume the API?
- Are error states handled across the stack?

Be honest—what would you flag in a code review?
```

---

## Time Management for Full-Stack

### The Critical Difference:

**You're building TWO applications in 3 hours.**

This means **you must be more ruthless about scope** than a backend-only assessment.

### Time Allocation (Strict):

```
Setup & Planning:          15 min
Backend Implementation:    90 min  (1.5 hours)
Frontend Implementation:   60 min  (1 hour)
Integration & Polish:      30 min
Final Review:              5 min
------------------------
Total:                     180 min (3 hours)
```

### Red Flags & Triage:

**At 60 minutes - should have:**
- ✅ Rails API models done
- ✅ Basic controller actions working
- ✅ At least one endpoint tested via curl

**Not there yet?**
```
Cursor, I'm behind schedule. Help me prioritize:
1. What's the absolute minimum Rails API for the frontend to work?
2. What can I defer or simplify?
3. What's the fastest path to a working full-stack app?
```

**At 2 hours - should have:**
- ✅ Complete Rails API working (all endpoints)
- ✅ Backend tests passing
- ✅ Started on React components

**Not there yet? Emergency triage:**
- Skip service objects, keep logic in models/controllers
- Skip some backend tests (keep controller tests)
- Simplify React components (just get it working)
- Skip React tests entirely
- **Focus on one complete feature working end-to-end**

**At 2.5 hours - should have:**
- ✅ Full-stack app working end-to-end
- ✅ All core features functional
- ✅ Basic error handling

**Not there yet? Absolute minimum:**
- Get ONE complete flow working (e.g., just "create and list")
- Document what you'd add with more time in README
- Make sure what you have is bug-free

---

## Common Full-Stack Pitfalls

### 1. Spending Too Long on Backend

**❌ Don't:**
- Perfect your Rails API with service objects, decorators, etc.
- Write exhaustive tests for every edge case
- Build endpoints you don't need for the frontend

**✅ Do:**
- Build exactly what the frontend needs
- Test the happy path + key error cases
- Move to frontend as soon as API works

### 2. Fighting CORS Issues

**This will eat your time. Be prepared.**

```ruby
# In Rails: config/initializers/cors.rb (uncomment and configure)
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3001'  # Your React dev server
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

# Make sure you have the gem
# Gemfile: gem 'rack-cors'
```

**If CORS breaks, prompt Cursor:**
```
I'm getting CORS errors when React tries to call Rails API.
Here's the error: [paste error]
Help me configure CORS properly for local development.
```

### 3. Over-Engineering the Frontend

**❌ Don't:**
- Set up Redux/MobX/complex state management
- Build a fancy component library
- Add animations and polish
- Implement routing if not required

**✅ Do:**
- Use React state and props
- Keep components simple
- Focus on functionality
- Basic styling is fine

### 4. Not Testing Integration

**❌ Don't:**
- Assume if both parts work separately, they'll work together
- Test frontend with mocked API only
- Skip manual end-to-end testing

**✅ Do:**
- Test the actual frontend calling actual backend
- Verify data flows correctly
- Check error handling across the stack

### 5. Poor Error Handling Across Stack

**Common failure mode:**
```typescript
// Frontend just shows "Error" with no details
catch (error) {
  setError('Something went wrong');
}
```

**Better:**
```typescript
catch (error) {
  const message = error instanceof Error 
    ? error.message 
    : 'An unexpected error occurred';
  setError(message);
}
```

**And on backend:**
```ruby
rescue_from ActiveRecord::RecordInvalid do |exception|
  render json: { 
    error: 'Validation failed',
    details: exception.record.errors.full_messages
  }, status: :unprocessable_entity
end
```

---

## Example Good Cursor Interactions for Full-Stack

### ✅ Showing Strategic Thinking:

**Backend:**
```
I'm deciding whether to use serializers or just render json: @resource.
Given I have 90 minutes for the entire backend and need to move to frontend,
what's the fastest approach that still shows good API design?
```

**Frontend:**
```
The PRD doesn't specify state management. Given I need to:
- Display a list
- Create new items
- Handle errors

Is React state sufficient, or should I use Context/Zustand?
I want to balance proper architecture with time constraints.
```

### ✅ Coordinating Full-Stack:

```
I just finished my Rails API. Before I start the React frontend, review:
1. Are my JSON responses structured well for frontend consumption?
2. Are my error responses consistent and parseable?
3. Do I have all the endpoints the frontend will need?
4. Any changes that would make the frontend easier to build?
```

### ✅ Debugging Across Stack:

```
My React app is calling the Rails API but I'm getting this error:
[paste error from browser console]

And this is what I see in Rails logs:
[paste Rails logs]

Help me identify if this is a frontend issue, backend issue, or integration issue.
```

### ✅ Time Management:

```
I'm 75 minutes in. I have:
- ✅ Rails API fully working
- ✅ Basic tests passing
- ❌ Haven't started frontend

Given I have 105 minutes left, help me prioritize my frontend work:
1. What components are absolutely necessary?
2. What can I simplify or skip?
3. Where should I focus to show full-stack competence?
```

---

## What Good Looks Like (Final Output)

### Rails API:
- Clean, RESTful endpoints
- Proper error handling with JSON responses
- Consistent response structure
- Tests for core functionality
- README with setup and API docs

### React Frontend:
- TypeScript throughout (no `any` types)
- API calls in separate service layer
- Loading and error states everywhere
- Clean, readable components
- Basic but functional UI

### Integration:
- Frontend successfully calls backend
- Data flows correctly
- Errors handled gracefully
- User gets feedback on actions

### Documentation:
- Clear setup instructions for both
- Any assumptions documented
- Known issues listed (if any)

---

## Emergency Scenarios

### "I Can't Get Rails and React Talking"

```
Cursor, I'm having trouble with integration. Here's my setup:
- Rails running on http://localhost:3000
- React running on http://localhost:3001
- Getting this error when React calls Rails: [paste error]

Here's my fetch call in React:
[paste code]

Here's my Rails controller:
[paste code]

Help me debug this quickly. Is it CORS? Is it the endpoint? Something else?
```

### "I'm Running Out of Time"

```
I have 30 minutes left and I need to:
- Finish React component [X]
- Add error handling
- Test everything
- Write README

What's the absolute minimum I need to do to have a working submission?
Should I cut scope or simplify something?
```

### "My Tests Are Failing Right Before Submission"

```
My tests are failing with 10 minutes left:
[paste test errors]

Should I:
1. Try to fix them quickly
2. Comment them out and explain in README
3. Submit with failing tests

What's the best move here?
```

---

## Post-Submission Reflection

After you submit, jot down notes:
- What went well in backend vs frontend?
- Where did I lose time?
- What would I do differently next time?
- Did I balance full-stack work effectively?
- What Cursor interactions were most helpful?

---

## Remember:

1. **You're building TWO apps in 3 hours** - be ruthless with scope
2. **Backend-first approach** - get API working before starting UI
3. **Functionality > Polish** - working features beat pretty UI
4. **Test integration** - both parts work separately ≠ they work together
5. **Show your thinking** - use Cursor to demonstrate judgment
6. **Time-box strictly** - don't let backend consume all your time

**You can do this.** You have strong Rails skills and solid React/TypeScript experience. Use this guide to stay organized, make smart tradeoffs, and ship a complete full-stack application.

Good luck! 🚀
