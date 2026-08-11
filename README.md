# RaceDay

## Programming 2B - POE

RaceDay is a full-stack web-based event management system designed for the South African running, walking, and cycling community.

The system is designed to help event organisers manage events, categories, participant enrolments, and race results. Participants can create accounts, browse available events, enrol in events by selecting a category, view their enrolment status, and view their personal race results.

The RaceDay system is being developed progressively across three parts:

- Part 1: System Planning and Database
- Part 2: RESTful API Development
- Part 3: MVC Web Application and Automation

---

## User Roles

### Organiser

The Organiser is responsible for managing race events and participant information.

The Organiser can: 

- Create events.
- Edit events.
- Delete events.
- Manage event categories.
- View participant enrolments.
- Capture participant finishing times.
- Capture participant finishing positions.
- View event results.

### Participant

The Participant can:

- Create an account.
- Log in to the system.
- View and update their profile.
- Browse available events.
- View event information and categories.
- Enrol in an event.
- Select a category when enrolling.
- View their enrolment status.
- View their personal race results.

---

## Part 1 - System Planning and Database

Part 1 focuses on planning and designing the RaceDay system before application development begins.

The following planning documents are included in the `docs` folder:

- `ERD.png` - Entity Relationship Diagram showing the database entities, attributes, keys and relationships.
- `APIEndpointPlan.pdf` - Planned REST API endpoints, including HTTP methods, routes, descriptions, roles, request bodies and expected responses.
- `RaceDay.sql` - SQL Server database script containing the database schema, constraints and sample data.

---

## Repository Structure

```text
RaceDay-POE/
│
├── .github/
│   └── workflows/
│       └── part1-validation.yml
│
├── docs/
│   ├── APIEndpointPlan.pdf
│   ├── ERD.png
│   └── RaceDay.sql
│
├── README.md
└── .gitignore
