module Rutodo

  # Todo is a class that represents, well, a todo.
  # Its @title and @description can be modified publicly; @id and @status can't.
  #
  # By default, @status is a pending todo. It can only be set to finished, and
  # not otherwise. For that purpose, mark_as_done! method exists, and @status
  # cannot be modified publicly.
  class Todo
    attr_reader   :id
    attr_accessor :title, :description
    attr_reader   :status

    # Initialize is a constructor of this class' instance.
    #
    # @param [Integer] id: id of the todo.
    # @param [String] title: title of the todo.
    # @param [String] description: description of the todo.
    # @param [Enum] status: status of the todo, either :pending or :finished.
    def initialize(id = nil, title = '', description = nil, status = :pending)
      @id          = id
      @title       = title
      @description = description
      @status      = status
    end

    # Mark as done will mark this todo as done.
    # This method changes the instance's state.
    def mark_as_done!
      @status = :finished
    end

    # Valid? will check if todo is valid. It will be valid unless the title is
    # nil, as a todo without a title is meaningless.
    def valid?
      return false if @title.nil?

      true
    end
  end
end
