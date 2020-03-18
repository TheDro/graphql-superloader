
module Loaders
  class ManyToManyLoader < GraphQL::Batch::Loader
    class << self
      def loader_key_for(*group_args)
        [self].concat([group_args.first, group_args.last[:column]])
      end
    end

    def initialize(model, column: model.primary_key, association_name: , scope: nil)
      @model = model
      @column = column.to_s
      @association_name = association_name
      @scope = scope
    end

    def load(key)
      super(key)
    end

    def perform(keys)
      records = query(keys)
      records.each { |record| fulfill(record, read_association(record)) }
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
