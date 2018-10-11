require 'sequel'

module Rutodo
  module Database

    # Todo is a class that represents todo dataset in storage.
    # It inherits Sequel::Model to use Sequel's ORM capability.
    class Todo < Sequel::Model

      # As entity will return a Rutodo::Todo that represents this instance.
      #
      # @return [Rutodo::Todo]: as described aboce.
      def as_entity
        Rutodo::Todo.new(
          id,
          title,
          description,
          done ? :finished : :pending
        )
      end

    end
  end
end
