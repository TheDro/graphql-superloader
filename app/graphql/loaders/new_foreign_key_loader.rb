
module Loaders
  class NewForeignKeyLoader < GraphQL::Batch::Loader
    def initialize(model, field)
      # @object = object
      @model = model
      @field = field
      reflection =  @model.reflect_on_association(@field)
      @target_model = reflection.klass
      @foreign_key = reflection.foreign_key
    end

    def self.loader_key_for(model, field)
      [self].concat([model, field])
    end

    def load(object)
      super(object.id) if respond_to? :id
      super(object)
    end

    def perform(ids)
      records = @target_model.where(@foreign_key => ids).each{}

      groups = records.group_by do |record|
        record.public_send(@foreign_key)
      end

      groups.each do |i, group|
        fulfill(group.first.public_send(@foreign_key), group)
      end

    end
  end
end