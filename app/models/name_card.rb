class NameCard < ActiveRecord::Base
  paginates_per 5
  belongs_to :user

      validates :name, presence:{message:"入力してください"},
                      length:{ maximum: 100}

      validates :adress, presence:{message:"入力してください"},
                         length:{ maximum: 256, message:"256文字以内で入力してください"}
      
      validates :tel, format:{ with: /[0-9]{4}-[0-9]{3}-[0-9]{4}/,
                               allow_blank: true,
                               allow_nil: true,
                               message:"電話番号は0000-000-0000の形式で入力してください"}
      
      validates :fax,  format:{ with: /[0-9]{4}-[0-9]{3}-[0-9]{4}/,
                               allow_blank: true,
                               allow_nil: true,
                               message:"FAX番号は0000-000-0000の形式で入力してください" }
      
      validates :url, length:{ maximum: 256, message:"256文字以内で入力してください"}
end
