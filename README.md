# SumIt Interview App

Welcome! This is a simple Rails app with minimal changes from the standard `rails new` invocation.

## General Instructions

    TODO: Fill me in

## Development

The app uses Docker to stand up a Postgres database.

### Dependencies

This app has the following dependencies
* Docker (installed using their installer [here](https://docs.docker.com/get-docker/))
* Ruby (preferably through a version manager such as [rbenv](https://github.com/rbenv/rbenv))
* Node (preferably through a version manager such as [nodenv](https://github.com/nodenv/nodenv))

### Setup

1. Clone this repo.
2. Run the [bin/setup]() script.
3. Run the [bin/dev]() to spin up the local server.
4. Visit `localhost:3000`, you should land on the home page.

### Tests

We use [RSpec](https://rspec.info/) for tests. To run them simply call

```shell
bundle exec rspec ./spec/path/to/file_spec.rb
```
