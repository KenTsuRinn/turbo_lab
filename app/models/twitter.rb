class Twitter < ApplicationRecord
  after_update_commit { broadcast_replace_to 'twitters' }

  has_rich_text :content

  validates :content, presence: true
end
