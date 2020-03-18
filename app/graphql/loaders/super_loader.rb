require './app/graphql/loaders/record_loader.rb'
require './app/graphql/loaders/foreign_key_loader.rb'

module Loaders::SuperLoader

  def self.lazy_load(object, field, scope: nil)

    model = object.class
    reflection = model.reflect_on_association(field)

    case reflection
    when ActiveRecord::Reflection::BelongsToReflection
      Loaders::RecordLoader.for(reflection.klass)
          .load(object.public_send(reflection.foreign_key))
    when ActiveRecord::Reflection::HasManyReflection
      Loaders::ForeignKeyLoader.for(reflection.klass, column: reflection.foreign_key, scope: scope)
          .load(object.id)
    end

    # Loaders::RecordLoader.for(Brand).load(object.brand_id)
    # Loaders::RecordLoader.for(Product, :brand).load(object.brand_id)
    # Loaders::ForeignKeyLoader.for(Brand, :products).load(object)

  end

  def lazy_loader(object, field, **args)
    Loaders::SuperLoader.lazy_load(object, field, args)
  end

end