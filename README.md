1. The app was created with `--ruby=ruby-2.0.0-p195`, but I still had to run `rvm use ruby-2.0.0-p195`, probably wrong rvm default setting on my part
2. `bundle`
3. change username / password in database.yml
4. `rake db:create`
5. `rails s -p 3000`
6. run rails specs: `rake spec`
7. configure the sinatra server to allow cross-site HTTP requests, see note below
8. start sinatra app
9. start a resque worker: `QUEUE=normal rake resque:work`
10. Open http://localhost:3000
11. You will see a message saying there is no data to display, and a link taking you to the resque interface
12. Go to the Schedule tab, click "Queue now" on the cms_import job
13. Check that it is successful
14. Refresh http://localhost:3000
15. Any changes in server.rb will be seen here after the resque job has been run (scheduled to do so every so often, see resque_schedule.yml)

IMPORTANT NOTE:
* The sinatra server does not allow cross site request:
* It does not allow $.ajax requests, not even with jsonp:
```
  W, [2014-01-15T21:28:24.735104 #7991]  WARN -- : attack prevented by Rack::Protection::JsonCsrf
```
* This would require quite a bit of work on the server app.
* LONG STORY SHORT: I just added `headers( "Access-Control-Allow-Origin" => "*" )` to get on with my life and get to the fun part, and worry about security later when it is in production :-)
