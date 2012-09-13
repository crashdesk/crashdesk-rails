crashdesk-rails
===============

Crashde.sk Rails Integration for [Crashde.sk](http://crashde.sk) service

How to Install
--------------

1. Install gem 
  
    a) Add the `crashdesk-rails` gem to your `Gemfile`

      ```ruby
      gem "crashdesk-rails"
      ```

      ```shell
      bundle install
      ```

    b) Install `crashdesk-rails` gem to your system

      ```shell
      gem install crashdesk-rails
      ```

3.  Generate initializator

    ```shell
    rails g crashdesk:initializator
    ```

Configuration
-------------

To configure additional settings, in initializator use the block syntax and set any
settings you need on the `config` block variables. For example:

```ruby
Crashdesk.configure do |config|
  config.app_key = "YOUR_API_KEY"
  config.use_ssl = true
end
```

###app_key

Your Bugsnag APP key (required).

```ruby
config.app_key = "YOUR_API_KEY"
```

###use_ssl

Enforces all communication with servers be made via SSL.

```ruby
config.use_ssl = true
```

By default, `use_ssl` is set to false.

Reporting bug or Feature request
--------------------------------

Please report any bugs or feature requests on the github issues page for this
project:

<https://github.com/crashdesk/crashdesk-rails/issues>


Contributing
------------

-   Fork the repo
-   Commit and push
-   [Make a pull request](https://help.github.com/articles/using-pull-requests)
-   Thank you!


License
-------

The Crashdeks Rails is free software released under the MIT License. 
See [LICENSE.txt](https://github.com/crashdesk/crashdesk-ruby/blob/master/MIT_LICENSE) for details.

