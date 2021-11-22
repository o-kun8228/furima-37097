FactoryBot.define do
  factory :item do
    brand_name         {"財布"}
    price             {1000}
    description_item {"長財布"}
    category_id  {2}
    status_id    {2}
    fee_id    {2}
    send_day_id    {2}
    shipping_area_id    {2}

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end




  end
end
