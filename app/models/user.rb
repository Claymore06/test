class User < ActiveRecord::Base
  paginates_per 5
  belongs_to :group
  has_many :name_cards, :dependent => :destroy
  
  validates :name, presence:{message:"入力してください"},
                   length:{maximum: 100, message:"100文字以内で入力してください"}

  validates :tel, length:{maximum: 13,message:"13文字以内で入力してください"},
                  format:{ with: /[0-9]{4}-[0-9]{3}-[0-9]{4}/, 
                           allow_nil: true, 
                           allow_blank: true,
                           message:"電話番号は0000-000-0000の形式で入力してください"
                         }
  
  validates :mail, length:{ maximum: 100,message:"100文字以内で入力してください"}, 
                   format:{ with: /[\S]+\@[\S]+\.[A-Za-z0-9_\.\-]+[\S]/, 
                            allow_blank: true, 
                            allow_nil:true ,
                            message:"有効なメールアドレスを入力してください"
                          }
end
