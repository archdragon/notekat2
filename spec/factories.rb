FactoryGirl.define do
  factory :user do
    email "user@email.com"
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

  factory :note do
    text "This is a note text"
    notebook
  end

  factory :notebook do
    name "Notebook One"
    factory :notebook_with_notes do
      after(:create) do |notebook, evaluator|
        create_list(:note, 2, notebook: notebook)
      end
    end
    user
  end
end