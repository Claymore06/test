# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_1, class: "User" do
    name    "テスト"
    tel "1110-111-1111"
    mail "itou.taichi@gmail.com"
  end
end
