class Reply < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
end

def author_name
  user.display_name
end