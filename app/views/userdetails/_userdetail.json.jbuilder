json.extract! userdetail, :id, :firstname, :lastname, :dateofbirth, :gender, :country, :interests, :created_at, :updated_at
json.url userdetail_url(userdetail, format: :json)
