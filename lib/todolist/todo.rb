module Todolist
  class Todo
    attr_reader   :id
    attr_accessor :title, :description
    attr_reader   :status

    def initialize(id = nil, title = '', description = nil, status = :pending)
      @id          = id
      @title       = title
      @description = description
      @status      = status
    end

    def mark_as_done!
      @status = :finished
    end

    def valid?
      return false if @title.nil?

      true
    end
  end
end
