# AirGear Aerospace Dev Log

## Day 1 - 20/07/20

-   Read through the Rubric Requirements for the Rails app
-   Researched and gathered ideas for the aviation marketplace app

## Day 2 - 21/07/20

-   Discussed the aviation idea to educators with its goals, target audience and implementation.
-   Integrated Rubric criteria to Trello Board
-   Researched good UI/UX design ideas for the app
-   Started with wireframing
-   Started with the documentation and some rubric requirements

## Day 3 - 22/07/20

-   Presented to class the general idea of the app as well as the current wireframes
-   Finished the wireframes for CRUD actions
-   Finished the sitemap for the MVP of the web app
-   Worked on the ERD using dbdiagram
-   Discussed with an educator regarding the associations of tables in the database and some additional and optional features of the app.

## Day 4 - 23/07/20

-   Populated the Trello Board - User Stories Column with user stories for an MVP.
-   Practiced and explored all things that come with scaffold keyword

## Day 5 -26/07/20

-   Watched the Self-referential association lesson
-   Explored TailwindCSS to use for the app

## Day 6 -27/07/20

-   Practiced devise and had a look under the hood of scaffold. Removed and Edited files that came from scaffold that I did not need.
-   Customised sign up, login and log out route names that comes with devise
-   Set up a redirect after sign up to create the profile page
-   Remove/Delete account feature
-   Authorisation: Edit and Delete option only for user but able to see/Show for logged in users
-   Setup associations: one profile to one user
-   Implemented authentications from both backend and front end

## Day 7 - 28/07/20

-   Integrated features implemented on the practice app to the actual web app including authentication(devise) and authorization; both from F/E and B/E
-   Added Listing, Account & Categories model and set their relationships and associations
-   Added Company name column and input field in the devise Account Model
-   Used country_select gem to prefill options for countries column
-   Used enum for conditions column

## Day 8 - 29/07/20

-   Explored currencies gem to populate currency drop down menu and for further use when converting currencies
-   Added validations and default values to inputs
-   Displayed more vendor details
-   Added category filters in the navbar to show listings by category.
-   Implemented Eager loading to solve N+1 queries
-   Added Image Uploading Feature with AWS as the cloud service.
-   Added Image upload feature to profile to allow profile pic
-   Added multiple image upload feature when creating a listing and shows primary photo in the listing index page.
-   Deployed app to heroku

## Day 9 - 30/07/20

-   Seeded default data to production database
-   Added sort_by method to sort listings according to their date with newest first
-   Fixed show profile page to show listings owned by the profile.
-   Added search feature for users to search according to part number or part name

## Day 10 - 31/07/20

-   Integrated tailwind css to project
-   Started doing designs according to wireframes with mobile-first ideology
-   Finished navbar for mobile

## Day 11 - 01/08/20

-   Finished sign-up, log-in, listing#new&edit mobile designs.
-   Applied pagy gem for pagination feature

## Day 12 - 02/08/20

-   Completed initial design for mobile

## Day 13 - 03/08/20

-   Added initial design for web/browser view

## Day 14 - 04/08/20

-   Completed initial design for web/browser view
-   Added money gem for converting one currency to the other and eu_bank gem for the conversion rates

## Day 15 - 05/08/20

-   Implemented currency conversion feature with Stimulus Reflex to handle realtime conversion — development.
-   Made some changes to integrate currency conversion feature to production - live website.

## Day 16 - 06/08/20

-   Created and edited company logo and minor changes made to navbar and footer

## Day 17 - 07/08/20

-   Finished initial design on the landing page

## Day 18 - 08/08/20

-   Initial design and implementation of the aviation news feature in development and production. Stored API keys appropriately.
-   Used FakerGem to populate database
-   Added clickable event to My Account to show more options based on user if logged in or not.
-   Added more informative comments to comply with the rubric

## Day 19 - 09/08/20

-   Changed top news delivered from a fortnight to a week ago.
-   Edited default 404 & 500 pages in production environment
-   Added a proper placeholder picture to profile and listing.
-   Added a rescue condition for RecordNotFound as redirect with error message
-   Added authentication condition before viewing account profile and listings as per user story.

## Day 20 - 10/08/20

-   Restructured file directories to comply with the rubric requirement
-   Finalized and organized documentation of the app to comply with the rubric requirement.

## Day 21 - 11/08/20

-   Prepared presentation and walk through of the app.
-   Submitted the app for marking.
