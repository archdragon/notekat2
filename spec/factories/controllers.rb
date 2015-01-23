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

  factory :note do
    text "This is a note text"
    notebook
  end

  factory :invalid_note, parent: :note do
    name nil
    user
  end

  factory :note_with_hashtags, parent: :note do
    ignore do
      hashtag_count 1
    end
    text do 
      final_text = ""
      (1..hashtag_count).each { |n| final_text << "#tag#{n}" } 
      final_text
    end
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

  factory :invalid_notebook, parent: :notebook do
    name nil
    user
  end
end