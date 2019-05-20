module FactoryBot
  module Syntax
    module Methods
      def attributes_with_foreign_keys(*args)
        FactoryBot.build(*args).attributes.delete_if do |k|
          %w[id type created_at updated_at].member?(k)
        end
      end
    end
  end
end
