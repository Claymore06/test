require 'spec_helper'

describe User do
      describe :name do
            context '入力値が空の場合、異常' do
                  subject{build(:user_1,name:'')}
                  its(:valid?){should be_false}
            end
            context '入力値がnilの場合、異常' do
                  subject{build(:user_1,name:nil)}
                  its(:valid?){should be_false}
            end
            context '入力値=MAXの場合、正常' do
                  subject{build(:user_1,name:'あ'*100)}
                  its(:valid?){should be_true}
            end
            context '入力値=MAX+1の場合、異常' do
                  subject{build(:user_1,name:'あ'*101)}
                  its(:valid?){should be_false}
            end
      end
      describe :mail do
            context '入力値=MAXの場合、正常' do
                  subject{build(:user_1,mail:'a'*92 + '@a.ne.jp')}
                  its(:valid?){should be_true}
            end
            context '入力値=MAX+1の場合、異常' do
                  subject{build(:user_1,mail:'a'*93 + '@a.ne.jp')}
                  its(:valid?){should be_false}
            end
            context '入力値がnilの場合、正常' do
                  subject{build(:user_1,mail:nil)}
                  its(:valid?){should be_true}
            end
            context '入力値が空の場合、正常' do
                  subject{build(:user_1,mail:'')}
                  its(:valid?){should be_true}
            end
            context '入力値がフォーマットに合致する場合、正常' do
                  subject{build(:user_1)}
                  its(:valid?){should be_true}
            end
            context '入力値がフォーマットと異なる場合(hogehoge.com)、異常' do
                  subject{build(:user_1,mail:'hogehoge.com')}
                  its(:valid?){should be_false}
            end
            context '入力値がフォーマットと異なる場合(hogehoge@.com)、異常' do
                  subject{build(:user_1,mail:'hogehoge@.com')}
                  its(:valid?){should be_false}
            end
      end
      describe :tel do
            context '入力値がnilの場合、正常' do
                  subject{build(:user_1,tel:nil)}
                  its(:valid?){should be_true}
            end
            context '入力値が空の場合、正常' do
                  subject{build(:user_1,tel:'')} 
                  its(:valid?){should be_true}
            end
            context '入力値がフォーマットと異なる場合(00-0000-0000)、異常' do
                  subject{build(:user_1,tel:'00-0000-0000')}
                  its(:valid?){should be_false}
            end
            context '入力値がフォーマットに合致する場合、正常' do
                  subject{build(:user_1)}
                  its(:valid?){should be_true}
            end
      end
end
