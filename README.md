1. The app was created with `--ruby=ruby-2.0.0-p195`, but I still had to run `rvm use ruby-2.0.0-p195`, probably wrong rvm default setting on my part
2. `bundle`
3. change username / password in database.yml
4. `rake db:create`
5. `rails s -p 3000`
6. run javascript specs by opening: `http://localhost:3000/jasmine`
7. run rails specs: `rake spec`
6. configure the sinatra server to allow cross-site HTTP requests, see note below
7. start sinatra app

IMPORTANT NOTE:
* The sinatra server does not allow cross site request:
* It does not allow $.ajax requests, not even with jsonp:
```
  W, [2014-01-15T21:28:24.735104 #7991]  WARN -- : attack prevented by Rack::Protection::JsonCsrf
```
* This would require quite a bit of work on the server app.
* LONG STORY SHORT: I just added `headers( "Access-Control-Allow-Origin" => "*" )` to get on with my life and get to the fun part, and worry about security later when it is in production :-)