json.extract! project, :id, :title, :technology, :description, :githublink, :created_at, :updated_at
json.url project_url(project, format: :json)
