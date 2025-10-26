#!/bin/bash

# Omada Practice Project Setup Script
# Run this script to create the complete Rails project

set -e  # Exit on error

echo "🚀 Creating Omada Practice Rails Project..."
echo ""

# Create the Rails project
echo "📦 Creating Rails API project..."
rails new omada_practice --api --database=sqlite3 --skip-test
cd omada_practice

echo ""
echo "✅ Rails project created!"
echo ""

# Add RSpec to Gemfile
echo "📝 Adding RSpec and FactoryBot to Gemfile..."
cat >> Gemfile << 'EOF'

group :development, :test do
  gem "rspec-rails", "~> 6.0"
  gem "factory_bot_rails"
end
EOF

# Install gems
echo ""
echo "📦 Installing gems..."
bundle install

# Initialize RSpec
echo ""
echo "🧪 Setting up RSpec..."
rails generate rspec:install

# Generate Member model
echo ""
echo "👤 Creating Member model..."
rails generate model Member name:string email:string program:string --no-test-framework

# Update the migration
echo ""
echo "📝 Updating migration with constraints..."
MIGRATION_FILE=$(ls db/migrate/*_create_members.rb)
cat > "$MIGRATION_FILE" << 'EOF'
class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :program, null: false

      t.timestamps
    end

    add_index :members, :email, unique: true
    add_index :members, :program
  end
end
EOF

# Update Member model with validations
echo "📝 Adding validations to Member model..."
cat > app/models/member.rb << 'EOF'
class Member < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :program, presence: true, inclusion: { 
    in: %w[diabetes_prevention hypertension weight_management musculoskeletal],
    message: "%{value} is not a valid program" 
  }
end
EOF

# Create seeds
echo "📝 Creating seed data..."
cat > db/seeds.rb << 'EOF'
# db/seeds.rb

# Clear existing data
Member.destroy_all

# Create sample members
members = Member.create!([
  {
    name: "Sarah Johnson",
    email: "sarah.j@example.com",
    program: "diabetes_prevention"
  },
  {
    name: "Michael Chen",
    email: "michael.c@example.com",
    program: "hypertension"
  },
  {
    name: "Emily Rodriguez",
    email: "emily.r@example.com",
    program: "weight_management"
  }
])

puts "Created #{Member.count} members:"
members.each do |member|
  puts "  - #{member.name} (#{member.program})"
end
EOF

# Create API controller
echo "📝 Creating API Members controller..."
mkdir -p app/controllers/api
cat > app/controllers/api/members_controller.rb << 'EOF'
module Api
  class MembersController < ApplicationController
    before_action :set_member, only: [:show]

    def index
      @members = Member.all
      render json: @members
    end

    def show
      render json: @member
    end

    private

    def set_member
      @member = Member.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Member not found' }, status: :not_found
    end
  end
end
EOF

# Update routes
echo "📝 Updating routes..."
cat > config/routes.rb << 'EOF'
Rails.application.routes.draw do
  namespace :api do
    resources :members, only: [:index, :show]
  end
end
EOF

# Run migrations
echo ""
echo "🗄️  Creating database and running migrations..."
rails db:create
rails db:migrate
rails db:seed

# Create PRD file
echo ""
echo "📄 Creating PRD.md..."
cat > PRD.md << 'EOF'
# Product Requirements Document: Member Weight Tracking

## Overview
Build an API endpoint that allows health coaches to track member weight measurements over time. This is a core feature for our diabetes prevention and weight management programs.

**Time Limit:** 2-3 hours

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

1. The base Rails application is already set up
2. You may use any gems already in the Gemfile
3. Feel free to use AI-assisted development tools
4. If you make any assumptions, document them in your README

---

## Questions?

If anything is unclear, make a reasonable assumption and document it. We're more interested in seeing your problem-solving approach than having you build exactly what we envisioned.

Good luck!
EOF

# Create README
echo "📄 Creating README..."
cat > README.md << 'EOF'
# Omada Health - Take-Home Assessment

Welcome to the Omada Health technical assessment! This is a simplified version of our member management API.

## Setup

This project is already set up! Just run:

```bash
bundle install  # If you haven't already
rails server
```

The API will be available at `http://localhost:3000`

## What's Already Built

This Rails API application includes:

- **Member Model**: Represents members enrolled in our health programs
  - Fields: `name`, `email`, `program`
  - Programs: "diabetes_prevention", "hypertension", "weight_management", "musculoskeletal"
  - Full validations included

- **Sample Data**: 3 members are seeded in the database

- **Existing API Endpoints**:
  - `GET /api/members` - List all members
  - `GET /api/members/:id` - Show a specific member

## Your Task

See the `PRD.md` file for your assignment details.

## Testing the API

### Get all members
```bash
curl http://localhost:3000/api/members
```

### Get specific member
```bash
curl http://localhost:3000/api/members/1
```

### Using Rails Console
```bash
rails console

# Check members
Member.count  # => 3
Member.first  # => Shows Sarah Johnson
```

## Running Tests

```bash
rspec
```

## Your Implementation

[Add your implementation notes here after completing the assessment]

Good luck! 🚀
EOF

echo ""
echo "✅ Project setup complete!"
echo ""
echo "📂 Project created in: omada_practice/"
echo ""
echo "🎯 Next steps:"
echo "   1. cd omada_practice"
echo "   2. Copy your .cursorrules file: cp ~/.cursorrules .cursorrules"
echo "   3. Start the server: rails server"
echo "   4. Test the API: curl http://localhost:3000/api/members"
echo "   5. Read PRD.md and start building!"
echo ""
echo "✨ Happy coding!"
