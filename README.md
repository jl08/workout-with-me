Do You Even?

Heroku: http://fitfriender.herokuapp.com/

Trello link: https://trello.com/b/TRFtLdsc/workoutwithme

Coveralls Progress

[![Coverage Status](https://coveralls.io/repos/nyc-cicadas-2015/workout-with-me/badge.svg?branch=master&service=github)](https://coveralls.io/github/nyc-cicadas-2015/workout-with-me?branch=master)

synposis
- User will be able to sign onto the site threw their facebook account.  After signing-up they will need to add a few activities (ie basketball, lift, run, play tennis).  After diong so they will be matched with other users with with similar activites based on the criteria they provided us.  If two people are matched they will be able to message one another.


MVP features
- User will sign in with facebook
- User will get matched with other user using an optimization algorithm
- when both users say yes to the request, a match will be created and they will be chat with each each
- The MVP will solely be on the mobile view
- JS swiping functionality
- detect users close to them using location via broswer

Add on features
- gym calendar
- Google Map Functionality


MIGRATIONS
users
  - name
  - email
  - password
  - age
  - gender
  - description

activities
  - name
  
matches
  - initiator_id
  - responder_id
  - accepted

ratings
  - rank
  - ratee_id
  - rater_id

user_activities
  - activity_id
  - user_id

