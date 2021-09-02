json.(user, :id, :email, :image, :username, :symptoms, :tests_done)
json.token user.generate_jwt