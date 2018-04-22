FactoryBot.define do
  sequence(:email) {|n| "user#{n}@gmail.com"}

  factory :user do
    email
    password "user111"
    first_name "Um"
    last_name "Example"
    admin false
  end

  factory :user2, class: User do
    email
    password "user222"
    first_name "Dois"
    last_name "Example"
    admin false
  end

end
