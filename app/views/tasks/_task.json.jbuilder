json.extract! task, :id, :name, :photo, :created_at, :updated_at
json.url task_url(task, format: :json)
