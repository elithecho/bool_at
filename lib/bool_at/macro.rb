# frozen_string_literal: true

module BoolAt
  module Macro
    module ClassMethods
      def bool_at(*keys)
        keys.each do |key|
          unless key.to_s.include?("_at")
            raise ArgumentError, "bool_at keys should be prefixed with `_at'"
          end

          key_attribute = key
          method_name = key.to_s.remove("_at")

          define_method(:"#{method_name}?") do
            send(key_attribute).present?
          end

          define_method(:"#{method_name}!") do
            send(:"#{key_attribute}=", Time.zone.now)
          end
        end
      end
    end
  end
end
