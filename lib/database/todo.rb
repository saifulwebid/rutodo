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

    def get(id)
      todo = Database::Todo[id]

      todo.as_entity
    end

    def get_all
      Database::Todo.map { |todo| todo.as_entity }
    end

    def get_pending
      Database::Todo.where(done: false).map { |todo| todo.as_entity }
    end

    def get_finished
      Database::Todo.where(done: true).map { |todo| todo.as_entity }
    end

    def insert(todo)
      todo = Database::Todo.new(
        title: todo.title,
        description: todo.description,
        done: todo.status == :finished
      )

      todo.save

      todo.as_entity
    end

    def update(todo)
      todo = Database::Todo[todo.id].set(
        title: todo.title,
        description: todo.description,
        done: todo.status == :finished
      )

      todo.save_changes

      todo.as_entity
    end
  end
end
