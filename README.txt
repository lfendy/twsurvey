Locally:
=============

gem install bundler
bundle install

foreman start
-or-
rackup

To push changes to Heroku:
==========================

git push heroku master


Load testing:
=============

cd test

./loadtest_get_survey.sh 1000 25

(where first arg is number of requests and second arg is concurrent users)

Note: - If you change the fields on the Google spreadsheet you will need to update post_data.txt
      - An easy way to update this is to use Chrome and then hit 'back' button after submit to view posted
        form parameters.
