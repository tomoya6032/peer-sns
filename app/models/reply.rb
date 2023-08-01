class Reply < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  def author_name
    user.display_name
  end



end

