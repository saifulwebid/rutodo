require 'sequel'
require 'todolist'

module Database

  # Todo is a class that represents todo dataset in storage.
  # It inherits Sequel::Model to use Sequel's ORM capability.
  class Todo < Sequel::Model

    # As entity will return a Todolist::Todo that represents this instance.
    #
    # @return [Todolist::Todo]: as described aboce.
    def as_entity
      Todolist::Todo.new(
        self.id,
        self.title,
        self.description,
        self.done ? :finished : :pending
      )
    end

  end
end
