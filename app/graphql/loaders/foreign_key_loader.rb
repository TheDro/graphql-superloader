module Loaders
  class ForeignKeyLoader < GraphQL::Batch::Loader
    class << self
      def loader_key_for(model, column:, scope: nil)
        [self, model, column, scope&.to_sql]
      end
    end

    def initialize(model, column:, scope: nil)
      @model = model
      @column = column.to_s
      @column_type = model.type_for_attribute(@column)
      @scope = scope
    end

    def load(key)
      super(key)
    end

    def perform(keys)
      records = query(keys)
      groups = records.group_by do |record|
        # Loaders::RecordLoader.fulfill(record.class, record.id, record)
        record.public_send(@column)
      end
      groups.each do |i, group|
        fulfill(group.first.public_send(@column), group)
      end

      # Sets to fill if key was not found in query
      keys.each { |key| fulfill(key, []) unless fulfilled?(key) }
    end

    private
    def query(keys)
      scope = @model
      if @scope
        scope = @scope
      end
      scope.where(@column => keys)
    end
  end
end
