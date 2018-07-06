# frozen_string_literal: true

require "active_record"
require "active_support"

require "bool_at/version"
require "bool_at/macro"

module BoolAt
  extend ActiveSupport::Concern
  include Macro
end

ActiveSupport.on_load(:active_record) do
  include BoolAt::Macro
end
