class Twitter < ApplicationRecord
  after_create_commit { broadcast_prepend_to 'twitters' }
  after_update_commit { broadcast_replace_to 'twitters' }
  after_destroy_commit { broadcast_remove_to 'twitters' }

  validates :content, presence: true
end
