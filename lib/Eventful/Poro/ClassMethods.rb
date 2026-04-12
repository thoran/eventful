# Eventful/Poro/ClassMethods.rb
# Eventful::Poro::ClassMethods

module Eventful
  module Poro
    module ClassMethods

      def <<(instance)
        instances << instance
      end
      alias_method :register, :<<

      def active
        gc
      end

      private

      def instances
        @instances ||= []
      end

      def gc
        instances.tap{|instances| instances.reject!{|i| !i.active?}}
      end

    end
  end
end
