
module Loaders
  class FixedManyToManyLoader < GraphQL::Batch::Loader
    class << self
      def loader_key_for(model, column:, association_name: , scope: nil)
        [self, column, association_name, scope&.to_sql]
      end
    end

    def initialize(model, column:, association_name: , scope: nil)
      @model = model
      @column = column.to_s
      @association_name = association_name
      @scope = scope
    end

    def perform(keys)
      records = query(keys)
      # byebug
      records.each { |record| fulfill(record.public_send(@column), read_association(record)) }
    end

    private

    def read_association(record)
      record.public_send(@association_name)
    end

    def query(keys)
      scope = @scope || @model
      scope.where(@column => keys).includes(@association_name)
    end
  end
end
