module Loaders
  class RecordLoader < GraphQL::Batch::Loader
    class << self
      def fulfill(model, key, value)
        self.for(model).load(key)
        self.for(model).prepare_from_outside(key, value)
      end
    end

    def initialize(model, column: model.primary_key, scope: nil)
      @model = model
      @column = column.to_s
      @column_type = model.type_for_attribute(@column)
      @scope = scope || @model
    end
    
    def load(key)
      super(key)
    end

    def perform(keys)
      query(keys).each { |record| fulfill(record.public_send(@column), record) }
      keys.each { |key| fulfill(key, nil) unless fulfilled?(key) }
    end

    def prepare_from_outside(key, value)
      fulfill(key, value)
    end

    private
    
      def query(keys)
        @scope.where(@column => keys)
      end
  end
end