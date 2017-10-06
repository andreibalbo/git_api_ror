json.extract! repository, :id, :repo_id, :name, :user, :description, :stars, :created_at, :updated_at
json.url repository_url(repository, format: :json)
