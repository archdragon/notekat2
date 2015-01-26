FactoryGirl.define do
  factory :note do
    text "This is a note text\nThis is a note text"
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
end