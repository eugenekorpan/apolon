require Rails.root.join('spec/factories/user.rb')

p "________________________ Seeded users: ___________________"

30.times do
  user = FactoryGirl.create(:user)
  p user.full_name
end
