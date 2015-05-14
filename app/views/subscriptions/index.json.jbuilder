json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :user_id, :course_id, :user_id, :course_id
  json.url subscription_url(subscription, format: :json)
end
