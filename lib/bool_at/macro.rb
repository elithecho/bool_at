# frozen_string_literal: true

module BoolAt
  module Macro
    module ClassMethods
      def bool_at(*attrs)
        attrs.each do |attr|
          at_attribute = "#{attr}_at"
          at_setter = "#{attr}_at="
          setter = "#{attr}="
          predicate = "#{attr}?"

          attribute attr, :boolean, default: false

          after_initialize do
            self[attr] = send(attr)
          end

          # Changes dirty state in virtual attribute
          define_method setter do |value|
            super(value)
            send(at_setter, self[attr] ? Time.now : nil)
          end

          define_method attr do
            send(at_attribute).present? if respond_to?(at_attribute)
          end

          define_method at_setter do |value|
            self[attr] = value.present?
            super(value)
          end

          alias_method predicate, attr

          scope attr, -> { where("#{table_name}.#{attr}_at IS NOT NULL") }
          scope :"not_#{attr}", -> { where("#{table_name}.#{attr}_at IS NULL") }
          scope :"order_#{attr}", -> { order("#{table_name}.#{attr}_at DESC") }
          scope :"reverse_#{attr}", -> { order("#{table_name}.#{attr}_at ASC") }
        end
      end
    end
  end
end
