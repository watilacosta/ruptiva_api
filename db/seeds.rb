puts 'CRIANDO USUÁRIO ADMIN'

admin = User.create!(
  first_name: "Maikel",
  last_name:  "Bald",
  email:      "maikel@ruptiva.com",
  password:   "ilikeruptiva",
  role:       "admin"
)

puts 'USUÁRIO ADMIN'
puts admin.inspect