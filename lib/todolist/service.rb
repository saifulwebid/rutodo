# All business logic of Todolist gem.
module Todolist
  class Service
    def initialize(service: nil)
      @service = service
    end

    def add(title = '', description = nil)
      todo = Todolist::Todo.new(nil, title, description)
      @service.insert(todo)
    end

    def edit(todo)
      @service.update(todo)
    end

    def mark_as_done(todo)
      todo.mark_as_done!
      edit(todo)
    end

    def get(id)
      @service.get(id)
    end

    def get_all
      @service.get_all
    end

    def get_pending
      @service.get_pending
    end

    def get_finished
      @service.get_finished
    end

    def delete(todo)
      @service.delete(todo)
    end

    def delete_finished
      @service.delete_finished
    end
  end
end
