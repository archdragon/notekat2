FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password "secure_user_password_1234"

    factory :user_with_notebooks do
      #after(:create) do |user, evaluator|
      #  create_list(:notebook, 2, user: user)
      #end

      after(:create) do |user, evaluator|
        create_list(:notebook, 1, user: user)
      end
    end
  end
end