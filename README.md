# Kids Catalog, Solo Project
[Turing School Module 3 Capstone Project](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/self_directed_project.md)<br>

* I prototyped an elementary school platform for a client, Mandarin Library Automation.
* I focused on parsing CSVs, Google OAuth implementation, database modeling and testing external APIs.<br><br>

**Tech Stack: Rails, JavaScript, jQuery, Bootstrap CSS, Open Library API, Google Books API, MiniTest, VCR/Webmock, Postgres**

![Kids Catalog GIF](http://g.recordit.co/R0DynxB9nj.gif)

## Setup

* Note: Make sure your postgres is up and running, and get application.yml google client ID and secret
* `bundle`
* `rake db:setup`
* `rake import`
* `rails s` - hosted at `localhost:3000` by default
* `rake test` to run test suite

## Test Coverage
SimpleCov: 162 / 168 LOC (96.43%) coverage.
