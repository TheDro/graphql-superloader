module Types
  module Reviewable
    include Types::BaseInterface

    field :name, String, null: false

    orphan_types Types::ProductType, Types::BrandType

    definition_methods do
      def resolve_type(object, _context)
        case object.class.name
        when "Product" then Types::ProductType
        when "Brand" then Types::BrandType
        else
          raise 'Unknown type'
        end
      end
    end
  end
end