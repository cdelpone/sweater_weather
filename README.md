# [Sweater Weather](https://github.com/cdelpone/sweater_weather)

## Table of contents
- [Overview](#overview)
- [Schema](#schema)
- [Setup](#setup)
- [API Setup](#api-setup)
- [Endpoints](#endpoints)
- [Technologies](#technologies)
- [Contributors](#contributors)

## <ins>Overview</ins>

Backend repo utilizing a service-oriented architecture for a fictitious front end application to plan road trips. The app will allow users to see the current weather as well as the forecasted weather at the destination.

Exposes an API to satisfy requirements from a front end application.

This project is based off Turing's Sweater Weather project. More details can be found [here](https://backend.turing.edu/module3/projects/sweater_weather/)

### <ins>Schema</ins>
<insert image>

### <ins>Setup</ins>
1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{drop,create,migrate}`
4. Run `bundle exec rspec` to test

### <ins>API Setup</ins>
1. Sign up for API keys from the following:
- MapQuest Geocoding API [here](https://developer.mapquest.com/documentation/geocoding-api/)
- Unsplash [here](link)
- OpenWeather One Call API [here](https://openweathermap.org/api/one-call-api)
2. Set-up Figaro: `bundle exec figaro install`
3. Navigate to /config/application.yml
4. Paste the following code and replace 'YOUR-API-KEY' with your respective credentials:
  ```
  MAPQUEST_KEY: 'YOUR-API-KEY'
  OPEN_WEATHER_KEY: 'YOUR-API-KEY'
  UNSPLASH_KEY: 'YOUR-API-KEY'
  ```

### <ins>Endpoints</ins>
[Endpoints](https://github.com/cdelpone/sweater_weather/blob/main/endpoints.md)

### <ins>Technologies</ins>

#### Versions
- Ruby 2.7.2
- Rails 5.2.5

#### Development
![Atom][Atom-img]
![Figaro][Figaro-img]
![Git][Git-img]
![Github][Github-img]
![Markdown][Markdown-img]
![PostgreSQL][PostgreSQL-img]
![Postman][Postman-img]
![Ruby on Rails][Ruby on Rails-img]
![Faraday][Faraday-img]

#### Languages
![ActiveRecord][ActiveRecord-img]
![Ruby][Ruby-img]

#### Testing
![Pry][Pry-img]
![RSPEC][RSPEC-img]
![Shoulda Matchers][Shoulda Matchers-img]
![Simplecov][Simplecov-img]
![VCR][VCR-img]
<!-- ![Capybara][Capybara-img] -->
<!-- ![Launchy][Launchy-img] -->
<!-- ![Webmock][Webmock-img] -->

#### Development Principles
![OOP][OOP-img]
![TDD][TDD-img]
![MVC][MVC-img]
![REST][REST-img]

### <ins>Contributors</ins>
![LinkedIn][LinkedIn-img]
- [Christina Delpone](https://www.linkedin.com/in/christinadelpone)

![Github][Github-img]
- [Christina Delpone](https://github.com/cdelpone)



<!-- Markdown link & img dfn's -->
[Github-img]: https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white

<!-- #### Development -->
[Atom-img]: https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white
[Faraday-img]: https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[Figaro-img]: https://img.shields.io/badge/figaro-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[Git-img]: https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white
[Github-img]: https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white
[Markdown-img]: https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white
[PostgreSQL-img]: https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white
[Postman-img]: https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white
[Ruby on Rails-img]: https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white
<!-- [Rubocop-img]: https://img.shields.io/badge/rubocop-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[Bootstrap-img]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white -->

<!-- #### Languages -->
[ActiveRecord-img]: https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white
[Ruby-img]: https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white
<!-- [CSS3-img]: https://img.shields.io/badge/CSS3-1572B6.svg?&style=flaste&logo=css3&logoColor=white
[HTML5-img]: https://img.shields.io/badge/HTML5-0EB201.svg?&style=flaste&logo=html5&logoColor=white -->

<!-- #### Deployment -->
<!-- [Heroku-img]: https://img.shields.io/badge/Heroku-430098.svg?&style=flaste&logo=heroku&logoColor=white
[Circle CI-img]: https://img.shields.io/badge/-CircleCi-brightgreen.svg?logo=LOGO -->


<!-- #### Testing -->
[Pry-img]: https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[RSPEC-img]: https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[Shoulda Matchers-img]: https://img.shields.io/badge/shoulda--matchers-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[Simplecov-img]: https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[VCR-img]: https://img.shields.io/badge/vcr-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
<!-- [Webmock-img]: https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[Capybara-img]: https://img.shields.io/badge/capybara-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[Launchy-img]: https://img.shields.io/badge/launchy-b81818.svg?&style=flaste&logo=rubygems&logoColor=white -->

<!-- #### Development Principles -->
[OOP-img]: https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white
[TDD-img]: https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white
[MVC-img]: https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white
[REST-img]: https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white

<!-- ### <ins>Contributors</ins> -->
[LinkedIn-img]: https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white
