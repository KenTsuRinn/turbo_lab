json.extract! twitter, :id, :content, :user, :like, :dislike, :created_at, :updated_at
json.url twitter_url(twitter, format: :json)
