# puts 'CRIANDO Usuários'

# 50.times do
#   admin = User.create!(
#     first_name: "Maikel",
#     last_name:  "Bald",
#     email:      "maikel@ruptiva.com",
#     password:   "ilikeruptiva",
#     role:       "admin"
#   )
# end

puts 'CRIANDO USUÁRIO ADMIN'

admin = User.find_or_create_by!(
  first_name: "Maikel",
  last_name: "Bald",
  email: "maikel@ruptiva.com",
  role: "admin"
) do |user|
  user.password = "ilikeruptiva"
  user.confirmed_at = Time.now
end

puts 'USUÁRIO ADMIN'
puts admin.inspect