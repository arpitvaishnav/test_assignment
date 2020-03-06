module Followable
  extend ActiveSupport::Concern

  included do
    has_many :followings, :as => :followable
  end
end