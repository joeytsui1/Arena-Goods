json.user do
  json.extract! @user, :id, :first, :last, :email, :created_at
end
