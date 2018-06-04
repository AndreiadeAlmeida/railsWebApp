FactoryBot.define do
  sequence(:email) {|n| "user#{n}@gmail.com"}

  factory :user do
    email "user@example.com"
    password "user111"
    first_name "Um"
    last_name "Example"
    admin false
  end

  factory :user2, class: User do
    email "user2@example.com"
    password "user222"
    first_name "Dois"
    last_name "Example"
    admin false
  end

  factory :admin, class: User do
    email "admin@example.com"
    password "user000"
    first_name "Main"
    last_name "User"
    admin true
  end


end
