# Eventful/Poro/InstanceMethods.rb
# Eventful::Poro::InstanceMethods

module Eventful
  module Poro
    module InstanceMethods

      def initialize(*)
        super
        self.class.register(self)
      end

    end
  end
end
