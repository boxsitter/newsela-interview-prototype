# Project Constitution: Dashboard Prototype

## 1. Core Mission
The purpose of this project is to build a tightly scoped, full-stack prototype in 6-8 hours to bridge the gap between my current expertise (Flutter, general web development) and the specific technology stack required for my upcoming developer interview. 

This prototype will serve as a tangible artifact to demonstrate:
1.  **Adaptability:** My ability to quickly pick up and implement a new stack (React, Python/FastAPI, Postgres).
2.  **Domain Interest:** My eagerness to work with and visualize K-12 educational data.
3.  **UI/UX Sensibility:** My strong eye for design and ability to create clean, user-friendly interfaces.
4.  **Full-Stack Comprehension:** My fundamental understanding of how data flows from a relational database, through a RESTful API, and into a frontend client.

## 2. Technical Stack
* **Database:** PostgreSQL (Relational data storage)
* **Backend:** Python with FastAPI (RESTful API creation)
* **Frontend:** React (Component-based UI)
* **Styling:** Modern CSS (Vanilla CSS modules)
* **Data Visualization:** Chart.js via `react-chartjs-2`

## 3. Implementation Details

### Database Schema (Read-Only for MVP)
To save time, the database will be manually seeded via a SQL script. No POST/PUT/DELETE routes are required for this prototype.
* `students`: `id` (PK), `first_name`, `last_name`, `grade_level`
* `assessments`: `id` (PK), `student_id` (FK), `subject` (Math, Reading, Science), `score` (0-100), `date`

### API Endpoints
* `GET /api/students`: Returns a joined list of students and their most recent assessment scores.
* `GET /api/assessments/averages`: Returns the aggregate average scores across all students grouped by subject (used specifically for the chart).

### Frontend Architecture
* **State Management:** React `useState` and `useEffect` hooks for data fetching.
* **Components:**
    * `DashboardLayout`: Main container with a clean header and responsive grid.
    * `MetricsOverview`: Top-level cards showing high-level stats (e.g., "Total Students", "Class Average").
    * `PerformanceChart`: A Chart.js Bar chart consuming the `/averages` endpoint.
    * `StudentTable`: A clean, well-designed HTML table consuming the `/students` endpoint.

## 4. Development Phases (6-8 Hour Timeline)

### Phase 1: Database Setup & Seeding (1 Hour)
* Install/Run PostgreSQL locally.
* Create the database.
* Execute an LLM-generated `.sql` script to create tables and insert ~20 dummy K-12 students with 3 assessment scores each.

### Phase 2: Backend API (2 Hours)
* Set up a Python virtual environment.
* Install `fastapi`, `uvicorn`, and a Postgres driver (`psycopg2` or `asyncpg`).
* Write database connection logic.
* Create and test the two `GET` endpoints using FastAPI's automatic Swagger UI (`/docs`).

### Phase 3: Frontend Foundation & API Integration (2.5 Hours)
* Scaffold a new React app (e.g., using Vite: `npm create vite@latest`).
* Build the static UI layout (focusing on ample whitespace, readable typography, and clean design).
* Implement data fetching using `fetch` or `axios` to connect to the FastAPI backend.
* Render the student data into the UI table.

### Phase 4: Data Visualization (1.5 Hours)
* Install `chart.js` and `react-chartjs-2`.
* Create the `PerformanceChart` component.
* Map the API data to the Chart.js dataset format.
* Style the chart tooltips and colors to match the UI's design system.

### Phase 5: Polish & Interview Prep (1 Hour)
* Clean up code (remove `console.log`s, format files).
* Review the codebase to ensure I can confidently explain how state moves and how the API connects to the database.
* Practice my "translation" points (e.g., "In Flutter I do X, which helped me understand React's Y").

## 5. Success Criteria
The project is successful if, by the end of the weekend, I can run `npm run dev` and `uvicorn main:app --reload`, open `localhost:5173`, and see a beautiful dashboard populated by real database data that I can confidently talk about in my interview.