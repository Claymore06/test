class Company < ActiveRecord::Base
  paginates_per 5
  has_many :groups, :dependent => :destroy
  
  validates :name,presence:{message:'社名を入力してください'}, 
                  length:{ maximum: 100, message:"100文字以内で入力してください"}

  validates :tel, format:{ with: /[0-9]{4}-[0-9]{3}-[0-9]{4}/,
                           allow_nil: true,
                           allow_blank: true,
                           message:"電話番号は0000-000-0000の形式で入力してください"
                          },
                  length:{ maximum: 13}

  validates :fax,  format:{ with: /[0-9]{4}-[0-9]{3}-[0-9]{4}/,
                          allow_nil: true,
                          allow_blank: true,
                          message:"FAX番号は0000-000-0000の形式で入力してください"
                          },
                   length:{ maximum: 13}

  validates :adress, length:{maximum: 100},
                     presence:{message:"住所を入力してください"} 
 
  validates :url, presence:{message:"URLを入力してください"},
                  length:{ maximum: 56, message:"56文字以内で入力してください"}
end
