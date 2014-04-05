require 'spec_helper'

describe NameCard do
 describe :name do
       context '入力値=MAXの場合、正常' do
            subject{ build(:name_card_1, name:'あ' * 100)}
            its(:valid?){ should be_true}
       end

       context '入力値=MAX+1の場合、異常' do
             subject{ build(:name_card_1,name:'あ' * (100 + 1))}
             its(:valid?){ should be_false}
       end
       
       context '入力値=nilの場合、異常' do
             subject{build(:name_card_1, name:nil)}
             its(:valid?){ should be_false}
       end

       context '入力値=空の場合、異常' do
             its(:valid?){ should be_false}
       end
 end

 describe :adress do
       context '入力値=MAXの場合、正常' do
             subject{ build(:name_card_1,adress:'あ'*256)}
             its(:valid?){ should be_true}
       end

       context '入力値=MAX+1の場合、異常' do
             subject{ build(:name_card_1,adress:'あ'*(256 + 1))}
             its(:valid?){ should be_false}
       end

       context '入力値=nilの場合、異常' do
             subject{ build(:name_card_1,adress:nil)}
             its(:valid?){ should be_false}
       end

       context '入力値=空の場合、異常' do
             subject{ build(:name_card_1,adress:'')}
             its(:valid?){ should be_false}
       end
 end
 describe :fax do
      context '入力値がフォーマットに合致する場合、正常' do
            subject{build(:name_card_1)}
            its(:valid?){ should be_true}
      end
      context '入力値がフォーマットと異なる場合(00-00000-0000)、異常' do
            subject{build(:name_card_1,fax:'00-00000-0000')}
            its(:valid?){ should be_false}
      end
      context '入力値がフォーマットと異なる場合(0-0-0)、異常' do
            subject{build(:name_card_1,fax:'0-0-0')}
            its(:valid?){ should be_false}
      end
      context '入力値がnilの場合、正常' do
            subject{build(:name_card_1,fax:nil)}
            its(:valid?){ should be_true}
      end
      context '入力値が空の場合、正常' do
            subject{build(:name_card_1,fax:'')}
            its(:valid?){ should be_true}
      end
 end
 describe :tel do
      context '入力値がフォーマットと合致している場合、正常' do
            subject{build(:name_card_1)}
            its(:valid?){ should be_true}
      end
      context '入力値がフォーマットと異なる場合(00-0000-0000)、異常' do
            subject{build(:name_card_1,tel:'00-0000-0000')}
            its(:valid?){ should be_false}
      end
      context '入力値がフォーマットと異なる場合(0-0-0)、異常' do
            subject{build(:name_card_1,tel:'0-0-0')}
            its(:valid?){ should be_false}
      end
      context '入力値がnilの場合、正常' do
            subject{build(:name_card_1,tel:nil)}
            its(:valid?){ should be_true}
      end
      context '入力値が空の場合、正常' do
            subject{build(:name_card_1,tel:'')}
            its(:valid?){ should be_true}
      end
 end
 describe :url do
      context '入力値=MAXの場合、正常' do
            subject{build(:name_card_1,url:'a'*256)}
            its(:valid?){ should be_true}
      end
      context '入力値=MAX+1の場合、異常' do
            subject{build(:name_card_1,url:'a'*(256 + 1))}
            its(:valid?){ should be_false}
      end
      context '入力値がnilの場合、正常' do
            subject{build(:name_card_1,url:nil)} 
            its(:valid?){ should be_true}
      end
      context '入力値が空の場合、正常' do
            subject{build(:name_card_1,url:'')}
            its(:valid?){ should be_true}
      end
 end

end
