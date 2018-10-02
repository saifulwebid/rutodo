# All business logic of Todolist gem.
module Todolist
  class Service
    def add
      raise NotImplementedError
    end

    def edit(todo, values = {})
      raise NotImplementedError
    end

    def mark_as_done(todo)
      raise NotImplementedError
    end

    def get(id)
      raise NotImplementedError
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
