require 'sequel'
require 'todolist'

module Database

  # TodoService is a wrapper around Database::Todo to do use case operations.
  # For all methods, Todolist::Todo instances will be returned instead of
  # Database::Todo instances that inherit from Sequel::Model.
  class TodoService

    # Get will get a todo with with particular id from the storage.
    #
    # @param [Integer] id: the id that will be retrieved from the storage.
    # @return [Todolist::Todo]: the retrieved todo from the storage.
    def get(id)
      todo = Database::Todo[id]

      todo.as_entity
    end

    # Get all will retrieve all todos from the storage.
    #
    # @return [Array[Todolist::Todo]]: the retrieved todos from the storage.
    def get_all
      Database::Todo.map { |todo| todo.as_entity }
    end

    # Get pending will retrieve all pending todos from the storage.
    #
    # @return [Array[Todolist::Todo]]: all pending todos from the storage.
    def get_pending
      Database::Todo.where(done: false).map { |todo| todo.as_entity }
    end

    # Get all will retrieve all finished todos from the storage.
    #
    # @return [Array[Todolist::Todo]]: all finished todos from the storage.
    def get_finished
      Database::Todo.where(done: true).map { |todo| todo.as_entity }
    end

    # Insert will insert a new todo to the storage.
    #
    # @param [Todolist::Todo] todo: the todo that will be inserted.
    # @return [Todolist::Todo]: inserted todo from the storage.
    def insert(todo)
      todo = Database::Todo.new(
        title: todo.title,
        description: todo.description,
        done: todo.status == :finished
      )

      todo.save

      todo.as_entity
    end

    # Update will update a todo in the storage.
    #
    # @param [Todolist::Todo] todo: modified todo to be updated in the storage.
    # @return [Todolist::Todo]: updated todo from the storage.
    def update(todo)
      todo = Database::Todo[todo.id].set(
        title: todo.title,
        description: todo.description,
        done: todo.status == :finished
      )

      todo.save_changes

      todo.as_entity
    end

    # Delete will delete a todo.
    #
    # @param [Todolist::Todo] todo: a todo that will be deleted.
    # @return [Todolist::Todo]: the deleted todo.
    def delete(todo)
      Database::Todo[todo.id].destroy.as_entity
    end

    # Delete finished will delete all finished todos.
    #
    # @return [Integer]: count of deleted todos.
    def delete_finished
      Database::Todo.where(done: true).delete
    end
  end
end
