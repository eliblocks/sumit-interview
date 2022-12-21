# SumIt Interview App

Welcome! This is a simple Rails app with minimal changes from the standard `rails new` invocation.

Considerations for the work you submitted:
- [ ] The requested features work
- [ ] Application is bootable and usable
- [ ] Unit, integration, feature, and or end-to-end testing considered
- [ ] Code is of sufficient quality and tidiness
- [ ] Includes documentation on how to utilize new features / updates

## Table of Contents
- [Instructions](#instructions)
  - [Account Management](#account-management)
    - [Creating an Account](#creating-an-account)
    - [Updating an Acccount](#updating-an-account)
    - [Reading an Account](#reading-an-account)
    - [Deleting an Account](#deleting-an-account)
  - [Checklist](#checklist)
  - [Tips](#tips)
  - [Extras](#extras)
- [Development](#development)
  - [Dependencies](#dependencies)
  - [Setup](#setup)
  - [Tests](#tests)
    

# Instructions
We recently added the [plutus](https://github.com/mbulat/plutus) Rails engine to handle some of our basic accounting needs. The engine also gives us access to a few basic views available under the `plutus/` route, take a second to poke around to get familiar with these views.

To complete the integration, we have the following remaining tasks:

## Account Management

We want to allow our users to manage their accounts. So we're going to implement the standard CRUD (create, read, update, delete) actions for the `Plutus::Account` model provided by the `plutus` gem.

As with any new feature, be sure to include tests for the various flows. There's a unique challenge here in that the models have been defined by a Rails engine, how would you work with that constraint?

### Creating an Account

When creating an account, we should allow the user to:

* choose from one of the existing account types (can be pulled from `Plutus::Account.types`)
* give the account a name
* after the account is created, we will need to email the administrator

    _Note_: You are not expected to implement an emailing solution, but give it some thought and leave a comment on how you'd do this.

### Updating an Account

The user should be able to make updates to the account, with the following restrictions:
* the name of the account can be made **as long as there are no transactions under the account**
* the type of the account **cannot** be changed once created

### Reading an Account

The show/read view should display basic information of the account. Just the type and name is fine.

There should also be a simple list view of the accounts displaying the type and the name of the accounts. The list should be filterable by account type.

### Deleting an Account

Similar to updating an account, the account can only be deleted when there are no transactions under the account.

## Checklist

The features are summarized here:

- [ ] Users can create and account, specifying the type from the list, and a full name
  - [ ] Email is sent to some email address once created
- [ ] Users can view a single account
- [ ] Users can view a list of accounts
  - [ ] The list can be filtered by account type
- [ ] Users can update an account
  - [ ] Users cannot update the type
  - [ ] Users cannot update the name if any transaction exists
- [ ] Users can delete an account, but only if there are no transactions
- [ ] Add an 'Accounts' nav option to the header next to 'General Ledger'

## Tips

* Rails provides a ton of [generators](https://guides.rubyonrails.org/command_line.html#bin-rails-generate) to help scaffold out this work, don't be afraid to use them!
* Don't focus too much on the UI layout, we're more interested in how you tackle the mechanics of the different features.
* Check out the documenation of the Plutus engine for information on how the models in the engine are configured.

## Extras

If you still have time and want to take this to another level, write some notes, or continue to add changes with the following in mind: one of the interesting challenges that we will be running into is the fact that Accounts will be associated with different entities (an entity is a legal entity such as an LLC or a Trust - the model already exists on the app).

How would you update your changes here to be able to associate a single entity to an account?

How about the index view of the accounts - how would we update the view to have filters based on the different entities (e.g. only show me accounts for LLC A, etc.)?

# Development

The app uses Docker to stand up a Postgres database.

## Dependencies

* Docker (install using their installer [here](https://docs.docker.com/get-docker/))
* Ruby (preferably through a version manager such as [rbenv](https://github.com/rbenv/rbenv))
* Node (preferably through a version manager such as [nodenv](https://github.com/nodenv/nodenv))

## Setup

1. Clone this repo.
2. Run the [bin/setup]() script.

    _Optional_: Run `rails db:seed` to seed the database.

3. Run the [bin/dev]() to spin up the local server.
4. Visit `localhost:3000`, you should land on the home page.

## Tests

We use [RSpec](https://rspec.info/) for tests. To run them simply call

```shell
bundle exec rspec ./spec/path/to/file_spec.rb
```
