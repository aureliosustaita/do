# To-Do

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

A task manager that logs completed tasks into a Motivation Bank. This encourages users to reflect on past progress when they feel unmotivated.

### App Evaluation

[Evaluation of your app across the following attributes]
- **Category:** Productivity
- **Mobile:** Uses push notifications and touch interactions for adding/deleting tasks. Could integrate with reminders and haptics.
- **Story:** Helps users stay organized and feel good about themselves by showing their own past successes. Especially great for students or anyone who struggles with motivation.
- **Market:** Students, young professionals, anyone with ADHD or anxiety who benefits from encouragement.
- **Habit:** Users return daily to check tasks, and visit Motivation Bank during moments of stress or burnout.
- **Scope:** MVP can include basic CRUD for tasks and a separate screen to view completed tasks. V2 can include streaks, quotes, and voice notes.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* [X]User can add a new task to their to-do list.
* [X]User can delete a task from their to-do list.
* [X}User can edit a task
* [X}User view tasks in calendar view

**Optional Nice-to-have Stories**

* User can log in and create an account.
* User can specify the time when task list will be cleared

### 2. Screen Archetypes

- Start Screen
* User can add task
* User can edit task
* User can delete task

-Delete Screen
* User can delete task

- Calendar Screen
* User can view the date tasks were added

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Task List
* Calendar View

**Flow Navigation** (Screen to Screen)

- [ ] [Home Screen]
* Calendar Screen
* Delete Screen
- [ ] [Calendar Screen]
* Home Screen
- [ ] [Delete Screen]
* Home Screen

## Wireframes

<div>
    <a href="https://www.loom.com/share/8a18ea637ae9497b8bde42d74fc83336">
    </a>
    <a href="https://www.loom.com/share/8a18ea637ae9497b8bde42d74fc83336">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/8a18ea637ae9497b8bde42d74fc83336-94f0628cddd94475-full-play.gif">
    </a>
  </div>
 

<div>
    <a href="https://www.loom.com/share/eeeede5f130f47269eba6fb441fb4b7a">
    </a>
    <a href="https://www.loom.com/share/eeeede5f130f47269eba6fb441fb4b7a">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/eeeede5f130f47269eba6fb441fb4b7a-d43e06e8e6520361-full-play.gif">
    </a>
  </div>
### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 

[This section will be completed in Unit 9]

Assignment 2: Sprint Planning and Development

Step 1: Identify Main Features

My App's Core Functionalities:
Task List Screen:
Add/Edit/Delete tasks.
Inline task editing (double-tap to edit).
Swipe-up gesture to "hide" tasks from list.
Calendar Screen:
Displays tasks based on their creation date.
Visual indicators (decorations) for task dates.
Task Detail View:
Displays a swipe-up gesture to delete (hide) the task.
Local Data Persistence:
All tasks are saved and loaded using UserDefaults.
Dynamic UI Elements:
Resizable task cells.
Responsive interaction.
Step 2: Breakdown into Sprints


Sprint	Goals / Features
Sprint 1	- Set up project structure.
- Create basic navigation and screens: Task List, Calendar.
Sprint 2	- Implement Task List with inline editing and swipe-up to hide tasks.
- Connect local data persistence.
Sprint 3	- Build Calendar Screen.
- Display tasks by creation date.
- Add calendar decorations for task dates.
Sprint 4	- Polish UI.
- Finalize dynamic resizing, visual improvements.
- Ensure seamless interaction between Task List and Calendar.
Step 3: Define Weekly Goals (SMART)

Sprint 1 Goal:
Specific: Set up project, navigation controller, and 2 screens (Task List & Calendar).
Measurable: 2 storyboard scenes linked with basic UI elements.
Achievable: Using Xcode storyboard, build skeleton UI.
Relevant: Foundational structure for app.
Time-bound: 1 day
Sprint 2 Goal:
Specific: Add ability to create/edit/hide tasks in Task List.
Measurable: Tasks are saved, editable via double-tap, and can be hidden.
Achievable: Implement with UITableView and UserDefaults.
Relevant: Core app functionality.
Time-bound: 2 days
Sprint 3 Goal:
Specific: Calendar displays task dates with visual indicators.
Measurable: Tasks appear when dates are selected in calendar.
Achievable: Use UICalendarView and filter by createdDate.
Relevant: Visual task tracking over time.
Time-bound: 1 day
Sprint 4 Goal:
Specific: Finalize dynamic UI behaviors and smooth transitions.
Measurable: No crashes, smooth edits/swipes, visually clean app.
Achievable: Refactor code, test all features.
Relevant: App ready for demo and evaluation.
Time-bound: 1 day.
Step 4: GitHub Management

Branching Strategy:
sprint-1-setup
sprint-2-tasklist
sprint-3-calendar
sprint-4-polish
Merge Process:
Each branch will be merged only after completing the sprint goal.
Follow best practices: Pull Requests, commit messages.
Step 5: Progress Update (Week 9 Submission)

✅ Task List screen created.
✅ Tasks can be added and edited.
✅ Swipe-up to delete task in detail view works.
✅ Calendar screen displays with basic navigation.
✅ Tasks saved using UserDefaults.


### Models

[Add table of models]

### Networking

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
