FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end
    nickname              {Faker::Name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {person.last.kanji}
    first_name            {person.first.kanji}
    family_name_kana      {person.last.katakana}
    first_name_kana       {person.first.katakana}
    birth_day             {"1991-06-05"}
  end
end