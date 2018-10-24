# Travelbook test task

## Afterthought

1. We should use full list of all street_services [here](../master/app/models/location.rb#L2).
This list is only for blueprinting the concept actually.
What we should use as a street_services list - `# Geocoder::Lookup.street_services - [:test]`
But they must be properly configured [here](../master/config/initializers/geocoder.rb#L24).

2. Also we can set the order of street_services [here](../master/app/models/location.rb#L4)
for better results, for example

```
geocoded_by :address, lookup: lambda{ |obj| obj.geocoder_lookup }

def geocoder_lookup
  if country_code == "RU"
    :yandex
  elsif country_code == "CN"
    :baidu
  else
    self.lookup || GEOCODER_STREET_SERVICES_LIST.first
  end
end
```

3. We can add cron task to geocode empty locations that was not be geocoded for unknown reasons (rate limiting, etc) before [Sidekiq Cron](https://github.com/ondrejbartas/sidekiq-cron)

```
class LocationGeocoderCronWorker
  include Sidekiq::Worker
  def perform(name, count)
    Location.not_geocoded ..
    # try to geocode
  end
end

Sidekiq::Cron::Job.create(name: 'Location Geocoder Worker - every 5min', cron: '*/5 * * * *', class: 'LocationGeocoderWorker') # execute at every 5 minutes, ex: 12:05, 12:10, 12:15...etc
# => true
```

4. There is an analog of geocoder gem - [GeoKit](https://github.com/geokit/geokit-rails).
Seems that it is more flexible, and I spent some time to implement a needed feature but choose geocoder because it is more popular (so we have more examples of implementation and answers to possible issues).
But if this task is real or have a part of the travelbook project I advise to check it more closely.

## Improvements

If I had more time, then I'd

* Improve test base
* Improve and specify errors system with validation of input file BTW I use as example [this](../master/spec/fixtures/files/locations_import.csv)
* Add rubocop and fix its offenses
* Add pagination on index view
* Create smoother views =)

## Developer Setup

Install rbenv - ruby version manager

https://github.com/rbenv/rbenv
```
brew update
brew install rbenv
```

Install ruby
```
rbenv install 2.5.1
```

Verify
```
ruby -v
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin17]
```

If you dont have rails 5 installed do this:

```
gem install bundler
gem install rails --no-ri --no-rdoc
```

Install all dependencies (first time it'll take awhile)
```
bundle install
```

Create test db and run specs to make sure everything is configured properly

```
rails db:setup
rails spec
```

Run interactive Rails console

```
rails c
```

Run the server

```
rails s # port 3000
rails s -p 5000 # different port
PORT=5000 rails s # another option
```

### ENV

There is one ENV variable that we must to provide to see google maps correctly.
`ENV['GOOGLE_MAPS_KEY']`

I use [DotEnv](https://github.com/bkeepers/dotenv) for this purposes

### Keeping it up-to-date

After the initial installation all you have to do keep your Rails environment up-to-date is periodically:

1. `git pull origin master` - get the latest
2. `rails db:migrate db:test:prepare` - in case there are new migrations (`db/migrations` dir)
3. `rails spec` - to make sure it still works

### Local Redis setup

Install latest version of redis with brew
```
brew unlink redis
brew install redis
```

To Start/Stop redis

```
brew services restart redis
brew services stop redis
```

To Start Sideliq

```
bundle exec sidekiq
```
