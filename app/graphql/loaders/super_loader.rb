require './app/graphql/loaders/record_loader.rb'
require './app/graphql/loaders/foreign_key_loader.rb'

module Loaders::SuperLoader


  def self.fixed_lazy_load(object, field, scope: nil)

    model = object.class
    reflection = model.reflect_on_association(field)

    # byebug
    case reflection
    when ActiveRecord::Reflection::BelongsToReflection
      Loaders::RecordLoader.for(reflection.klass)
          .load(object.public_send(reflection.foreign_key))
    when ActiveRecord::Reflection::HasManyReflection
      Loaders::FixedForeignKeyLoader.for(reflection.klass, column: reflection.foreign_key, scope: scope)
          .load(object.id)
    when ActiveRecord::Reflection::ThroughReflection
      # linker = model.reflect_on_association(reflection.options[:through])
      # Loaders::FixedForeignKeyLoader.for(linker.class, column: linker.foreign_key).load(object.id).then do |link_object|
      #   Loaders::RecordLoader.for(reflection.klass).load(link_object.public_send(reflection.foreign_key))
      # end
      Loaders::FixedManyToManyLoader.for(model, column: model.primary_key, association_name: field, scope: scope)
          .load(object.id)
    else
      byebug
    end
    # Relations:
    # belongs_to                 done
    # has_many                   done
    # has_many :through          done
    # has_one
    # has_one :through
    # has_and_belongs_to_many
    # polymorphic?

  end



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
    # Relations:
    # belongs_to                 done
    # has_many                   done
    # has_many :through
    # has_one
    # has_one :through
    # has_and_belongs_to_many
    # polymorphic?

  end



  def lazy_loader(object, field, **args)
    Loaders::SuperLoader.lazy_load(object, field, args)
  end

  def fixed_lazy_loader(object, field, **args)
    Loaders::SuperLoader.fixed_lazy_load(object, field, args)
  end

end