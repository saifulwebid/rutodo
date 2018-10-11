require 'sequel'

module Rutodo
  module Database

    # TodoService is a wrapper around Rutodo::Database::Todo to do use case
    # operations. For all methods, Rutodo::Todo instances will be returned
    # instead of Rutodo::Database::Todo instances that inherit from
    # Sequel::Model.
    class TodoService

      # Get will get a todo with with particular id from the storage.
      #
      # @param [Integer] id: the id that will be retrieved from the storage.
      # @return [Rutodo::Todo]: the retrieved todo from the storage.
      def get(id)
        todo = Rutodo::Database::Todo[id]

        todo.as_entity
      end

      # Get all will retrieve all todos from the storage.
      #
      # @return [Array[Rutodo::Todo]]: the retrieved todos from the storage.
      def get_all
        Rutodo::Database::Todo.map(&:as_entity)
      end

      # Get pending will retrieve all pending todos from the storage.
      #
      # @return [Array[Rutodo::Todo]]: all pending todos from the storage.
      def get_pending
        Rutodo::Database::Todo.where(done: false).map(&:as_entity)
      end

      # Get all will retrieve all finished todos from the storage.
      #
      # @return [Array[Rutodo::Todo]]: all finished todos from the storage.
      def get_finished
        Rutodo::Database::Todo.where(done: true).map(&:as_entity)
      end

      # Insert will insert a new todo to the storage.
      #
      # @param [Rutodo::Todo] todo: the todo that will be inserted.
      # @return [Rutodo::Todo]: inserted todo from the storage.
      def insert(todo)
        todo = Rutodo::Database::Todo.new(
          title: todo.title,
          description: todo.description,
          done: todo.status == :finished
        )

        todo.save

        todo.as_entity
      end

      # Update will update a todo in the storage.
      #
      # @param [Rutodo::Todo] todo: modified todo to be updated in the storage.
      # @return [Rutodo::Todo]: updated todo from the storage.
      def update(todo)
        todo = Rutodo::Database::Todo[todo.id].set(
          title: todo.title,
          description: todo.description,
          done: todo.status == :finished
        )

        todo.save_changes

        todo.as_entity
      end

      # Delete will delete a todo.
      #
      # @param [Rutodo::Todo] todo: a todo that will be deleted.
      # @return [Rutodo::Todo]: the deleted todo.
      def delete(todo)
        Rutodo::Database::Todo[todo.id].destroy.as_entity
      end

      # Delete finished will delete all finished todos.
      #
      # @return [Integer]: count of deleted todos.
      def delete_finished
        Rutodo::Database::Todo.where(done: true).delete
      end
    end
  end
end
