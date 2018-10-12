# rutodo

A gem to simply store todos.

## Installation

Include the gem in your Ruby app's `Gemfile`:

```ruby
gem "rutodo", :git => "https://github.com/saifulwebid/rutodo.git"
```

Then do a `bundle install`.

After that, configure the database connection by environment variables declared in `env.sample` file.

### Migrate database

Include Rutodo's `Rakefile` to your project's `Rakefile`:

```ruby
  spec = Gem::Specification.find_by_name 'rutodo'
  rakefile = "#{spec.gem_dir}/lib/rutodo/Rakefile"
  load rakefile
```

Then, do this:

```sh
rake todolist:migrate
```

## Dependency

This gem needs a MySQL database to store todos.

## Scope

This gem should be able to:

* add a new todo,
* edit a pending todo,
* mark a pending todo as done,
* retrieve detail of a todo,
* list all todos,
* list pending todos,
* list finished todos,
* delete a pending todo,
* delete finished todos.

A todo can be either pending or finished. The status is determined by user actions.

A todo consists of:

* ID (integer, required),
* title (string, required),
* description (string, optional),
* status (enum, required, either `pending` or `finished`).

## Usage

Set up rutodo dependency first:

```ruby
require 'rutodo/database'

db_service = Rutodo::Database::TodoService.new
todo_service = Rutodo::Service.new(service: db_service)
```

Then, you can use `todo_service` to manage your todos.

### Add a new todo

```ruby
todo = todo_service.add("Buy battery", "Buy two AA batteries from Bukalapak")
# todo will contain a Todo object from database.
# This todo is pending; it means that it is not done.
```

### Edit a pending todo

```ruby
todo.title = "Buy two batteries"
todo = todo_service.edit(todo)
```

### Mark a pending todo as done

```ruby
todo = todo_service.mark_as_done(todo)
```

### Retrieve detail of a todo

```ruby
todo = todo_service.get(1) # the todo's ID
```

### List all todos

```ruby
todos = todo_service.get_all
```

### List pending todos

```ruby
todos = todo_service.get_pending
```

### List finished todos

```ruby
todos = todo_service.get_finished
```

### Delete a pending todo

```ruby
todo_service.delete(todo)
```

### Delete finished todos

```ruby
todo_service.delete_finished
```
