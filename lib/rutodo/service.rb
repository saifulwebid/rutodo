# All business logic of Rutodo gem.
module Rutodo

  # Service is a class that represents this gem's use cases.
  # It is a class because a dependency (Database::TodoService) is needed.
  class Service

    # Initialize is a constructor of this class' instance.
    #
    # @param [TodoService] service: an instance of Database::TodoService.
    def initialize(service: nil)
      @service = service
    end

    # Add will add a new todo to the storage.
    #
    # @param [String] title: title of the todo.
    # @param [String] description: description of the todo.
    # @return [Rutodo::Todo]: a todo created on the storage,
    #                           but will return false if todo is invalid.
    def add(title = '', description = nil)
      todo = Rutodo::Todo.new(nil, title, description)

      return false unless todo.valid?

      @service.insert(todo)
    end

    # Edit will edit a todo's information in the storage.
    #
    # @param [Rutodo::Todo] todo: an edited todo that will be persisted.
    #                               It responds to .valid? which will make sure
    #                               that the attributes is valid.
    # @return [Rutodo::Todo]: will return false if the todo is invalid, and
    #                           will return updated todo from storage otherwise.
    def edit(todo)
      return false unless todo.valid?

      @service.update(todo)
    end

    # Mark as done will mark the supplied todo as done in the storage.
    #
    # @param [Rutodo::Todo] todo: the todo that will be marked as done.
    # @return [Rutodo::Todo]: the updated todo from the storage.
    def mark_as_done(todo)
      todo.mark_as_done!
      edit(todo)
    end

    # Get will retrieve a todo with particular id from the storage.
    #
    # @param [Integer] id: the id that will be retrieved from the storage.
    # @return [Rutodo::Todo]: the retrieved todo from the storage.
    def get(id)
      @service.get(id)
    end

    # Get all will retrieve all todos from the storage.
    #
    # @return [Array[Rutodo::Todo]]: the retrieved todos from the storage.
    def get_all
      @service.get_all
    end

    # Get pending will retrieve all pending todos from the storage.
    #
    # @return [Array[Rutodo::Todo]]: all pending todos from the storage.
    def get_pending
      @service.get_pending
    end

    # Get all will retrieve all finished todos from the storage.
    #
    # @return [Array[Rutodo::Todo]]: all finished todos from the storage.
    def get_finished
      @service.get_finished
    end

    # Delete will delete a todo.
    #
    # @param [Rutodo::Todo] todo: a todo that will be deleted.
    # @return [Rutodo::Todo]: the deleted todo.
    def delete(todo)
      @service.delete(todo)
    end

    # Delete finished will delete all finished todos.
    #
    # @return [Integer]: count of deleted todos.
    def delete_finished
      @service.delete_finished
    end
  end
end
