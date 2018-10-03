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
      raise NotImplementedError
    end

    def get_pending
      raise NotImplementedError
    end

    def get_finished
      raise NotImplementedError
    end

    def delete(id)
      raise NotImplementedError
    end

    def delete_finished
      raise NotImplementedError
    end
  end
end
