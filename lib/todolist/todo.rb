module Todolist
  class Todo
    attr_reader   :id
    attr_accessor :title, :description
    attr_reader   :status

    def initialize(id = nil, title = '', description = '', status = :pending)
      @id          = id
      @title       = title
      @description = description
      @status      = status
    end
  end
end
