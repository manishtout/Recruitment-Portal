class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def set_current_user
    User.current = current_user
  end
end
