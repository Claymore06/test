# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :name_card_1, class: "NameCard" do
    name    "テスト"
    adress "東京都墨田区のどこか"
    fax "0000-000-0000"
    tel "1110-111-1111"
    url "http://www.google.com"
  end
end
