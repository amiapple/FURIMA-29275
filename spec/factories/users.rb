FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {"password0"}
    password_confirmation {"password0"}
    first_name            {"太郎"}
    family_name           {"山田"}
    first_name_kana       {"タロウ"}
    family_name_kana      {"ヤマダ"}
    birthday              {"1930-01-01"}

  end
end