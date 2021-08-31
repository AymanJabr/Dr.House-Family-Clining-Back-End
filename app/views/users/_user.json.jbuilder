json.(user, :id, :email, :image, :username, :symptoms, :test_done)
json.token user.generate_jwt