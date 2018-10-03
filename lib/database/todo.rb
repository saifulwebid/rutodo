require 'sequel'
require 'todolist'

module Database
  class Todo < Sequel::Model

    def as_entity
      Todolist::Todo.new(
        self.id,
        self.title,
        self.description,
        self.done ? :finished : :pending
      )
    end

  end

  class TodoService

    def insert(todo)
      todo = Database::Todo.new(
        title: todo.title,
        description: todo.description,
        done: todo.status == :finished
      )

      todo.save

      todo.as_entity
    end

  end
end
