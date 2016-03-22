json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :address, :email, :phone_number, :password_hash, :password_salt
  json.url user_url(user, format: :json)
end
