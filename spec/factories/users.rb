FactoryBot.define do
  factory :user do
    nickname                     {Faker::Name.initials(number: 2)}
    family_name                  {Gimei.first.kanji }
    family_name_zenkaku_katakana {Gimei.first.katakana }
    first_name                   {Gimei.last.kanji }
    first_name_zenkaku_katakana  {Gimei.last.katakana }
    email                        {Faker::Internet.free_email}
    password                     {"1a"+Faker::Internet.password(min_length: 6)}
    password_confirmation        {password}
    birthday                     { Faker::Date.birthday}
  end
end


# gem 'gimei'

