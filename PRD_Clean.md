# Product Requirements Document: Member Weight Tracking

## Overview

Build an API endpoint that allows health coaches to track member weight measurements over time. This is a core feature for our diabetes prevention and weight management programs.

**Time Limit:** 2-3 hours


---


## Project Setup

To set up the base Rails project, run the provided setup script:

```bash
# Run the setup script
bash setup_omada_practice.sh

# Navigate into the project
cd omada_practice

# Copy your .cursorrules file (if you have one)
cp ~/.cursorrules .cursorrules

# Verify setup by starting the server
rails server

# In another terminal, test the existing API
curl http://localhost:3000/api/members
```

You should see JSON with 3 sample members. The base project is now ready!


---


## Requirements

### Functional Requirements

**As a health coach, I need to:**
- Record weight measurements for my members
- View a member's weight history
- See how much weight a member has lost/gained since starting

**Business Rules:**
- Weight measurements should include: weight (in pounds) and date measured
- Weight must be a positive number (reasonable range: 50-1000 lbs)
- Members can have multiple weight measurements over time
- We need to track weight change from their starting weight

### Technical Requirements

**You must implement:**
1. A RESTful API for creating and retrieving weight measurements
2. Appropriate data models and database schema
3. Input validation and error handling
4. Tests for your implementation

**Existing System:**
- Our app already has a `Member` model with `id`, `name`, `email`, and `program` fields
- You do not need to create or modify the Member model
- Assume members already exist in the database


---


## Deliverables

1. Database migration(s) for any new tables
2. Model(s) with appropriate validations and associations
3. Controller(s) with API endpoints
4. Routes
5. Tests
6. Brief README explaining your approach and any assumptions


---


## Evaluation Criteria

We will evaluate your submission on:
- **Code quality**: Clean, readable, well-organized code
- **Rails conventions**: Proper use of Rails patterns and best practices
- **Functionality**: Does it work as specified?
- **Error handling**: Graceful handling of edge cases
- **Testing**: Meaningful test coverage


---


## Getting Started

1. The base Rails application will be provided separately
2. You may use any gems already in the Gemfile
3. Feel free to use AI-assisted development tools
4. If you make any assumptions, document them in your README


---


## Questions?

If anything is unclear, make a reasonable assumption and document it. We're more interested in seeing your problem-solving approach than having you build exactly what we envisioned.

Good luck!
