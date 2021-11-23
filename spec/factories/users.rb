FactoryBot.define do
  factory :user do
    nickname                     { Faker::Name.initials(number: 2) }
    family_name                  { '山田' }
    family_name_zenkaku_katakana { 'ヤマダ' }
    first_name                   { '太郎' }
    first_name_zenkaku_katakana  { 'タロウ' }
    email                        { Faker::Internet.free_email }
    password                     { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation        { password }
    birthday                     { Faker::Date.birthday }
  end
end
