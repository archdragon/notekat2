FactoryGirl.define do
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