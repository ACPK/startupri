StartupRI.org
=========
 
Ultimate guide for local startup events, companies, and resources.

The site is built with Ruby on Rails in the back-end, and Angular.JS for the front-end.

Mobile Angular UI Theme: http://mobileangularui.com

## Requirements

-  Ubuntu/Debian/CentOS/RHEL (StartupRI.org uses Heroku)
-  Ruby 2.1.3
-  PostgreSQL
-  Rake Scheduler (Free Heroku Add-on: https://devcenter.heroku.com/articles/scheduler)
-  API Data Sources (See Below)


## Installation

1.  Download app locally
2.  Rename Application.sample.yml to Application.yml
3.  In Application.yml, create a SECRET_KEY_BASE, include Data Source URLs, and setup Active_admin username and password
4.  Rename Database.sample.yml to Database.yml
5.  In Database.yml, add Postgres database settings
6.  $ Bundle Install
7.  $ Rake rb:create
8.  $ Rake rb:migrate
9.  $ Rake rb:setup
10. Download New Events from Meetup and Eventbrite:  $ Rake new_events
11. Download New Startups from Angellist and Crunchbase:  $ Rake new_statups
12. Visit http://localhost:3000/admin, "events" or "startups", and mark any unwanted entries as "hidden"
   - If you just delete them, they will be created again when the rake task runs.
13. Uses Letter Opener for testing email locally (https://github.com/ryanb/letter_opener)
14. Sign up for http://mailjet.com, and include your email settings in Application.YML

- For any questions or comments, find me at http://twitter.com/andrewcpkelley


## Data Sources

1. Meetup API
  -  http://www.meetup.com/meetup_api
  -  Sample JSON: http://api.meetup.com/2/open_events?status=upcoming&radius=25.0&category=2&and_text=False&limited_events=False&desc=False&offset=0&photo-host=public&format=json&zip=02903&page=20&sig_id=[YOUR_ID]&sig=[YOUR_KEY]

2. Eventbrite API
  -  http://developer.eventbrite.com/docs
  -  Sample JSON: https://www.eventbriteapi.com/v3/events/search/?q=Business+%26+Professional&venue.city=providence&token=[YOUR_TOKEN]

3. Angellist API
  -  https://angel.co/api
  -  Sample JSON: https://api.angel.co/1/tags/1712/startups

4. CrunchBase
  -  https://developer.crunchbase.com
  -  Sample JSON: http://api.crunchbase.com/v/2/organizations?organization_types=company&location_uuids=0b4dddee615bed9bbdfc79d89322881d&user_key=[USER_KEY]



## JSON API

1. Events:  https://StartupRI.org/api/v1/events

2. Startups:  https://StartupRI.org/api/v1/startups

3. Resources:  https://StartupRI.org/api/v1/resources


## Coming Soon Projects You Can Contribute To

-  iPhone and Android Apps (Probably going to use Angular.JS and https://github.com/lynndylanhurley/ng-token-auth)
-  Implement way to find local start-up resources automatically
-  SEO and Pretender Implementation
-  Auto-tweeting
-  and more!

## Other
-  Cool JSON Viewer:  http://jsonviewer.stack.hu
