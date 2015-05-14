## Hyve
[Hyve Web App](http://hyveplus.com)

[![Circle CI](https://circleci.com/gh/vltlabs/hive.svg?style=svg&circle-token=38e7c56da2d19f76b78aecf5edb843aabea43de2)](https://circleci.com/gh/vltlabs/hive)

[![Code Climate](https://codeclimate.com/repos/54c0634ce30ba05cb80022e0/badges/65585822f6771e3da492/gpa.svg)](https://codeclimate.com/repos/54c0634ce30ba05cb80022e0/feed)
[![Test Coverage](https://codeclimate.com/repos/54c0634ce30ba05cb80022e0/badges/65585822f6771e3da492/coverage.svg)](https://codeclimate.com/repos/54c0634ce30ba05cb80022e0/coverage)

### Quick Start

1. Clone the repo

        $ git clone https://github.com/vltlabs/hive.git


2. Copy necessary files

        $ cp config/database.yml.sample config/database.yml
        $ cp .env.sample .env


3. Setup database

        $ rake db:setup


3a. Run them tests

        bundle exec rspec

4. Start the server

        $ rails s


### Staging/Production Deployment
1. Push to Github master branch

        $ git push origin master

2. Make sure tests pass (Automatic deploys from Github master to hyve-staging herokuapp if CI tests pass)
3. Enable [Heroku Pipeline](https://devcenter.heroku.com/articles/labs-pipelines)

        $ heroku labs:enable pipelines
        $ heroku plugins:install git://github.com/heroku/heroku-pipeline.git

4. Promote hyve-staging to hyve-production with heroku pipeline

        $ heroku pipeline:promote


### Production Support
1. Get added as a collaborator to hyve-staging and hyve-production on Heroku.
2. Commands:

        heroku run rails c -a supahands-production
        heroku logs -t -a supahands-production


