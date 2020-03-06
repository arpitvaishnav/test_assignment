class Following < ApplicationRecord
  belongs_to :followable, :polymorphic => true
end
