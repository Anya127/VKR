json.extract! post, :id, :name_p, :full_name_p, :category_id, :created_at, :updated_at
json.url post_url(post, format: :json)
