require 'spec_helper'

describe UsersController do
  before(:each) do
   @company = FactoryGirl.create(:company_1)
   @group = FactoryGirl.create(:group_1)
   @group.company = @company
   @user = @group.users.new
   @user.group = @group
  end

  # viewの検証までする
  render_views
  describe " GET :index" do
    subject { get :index, :company_id => @company.id,:group_id => @group.id }
    it { should be_success }
  end

  describe " GET :new" do
    subject { get :new ,:company_id => @company.id,:group_id => @group.id}
    it { should be_success }
  end

  describe " POST :create" do
    context '保存に成功した場合' do
      subject { post :create,:company_id => @company.id ,:user => {"name" => "hoge", "tel" => "1111-222-3333", "mail" => "hogehoge@gmail.com"}, :group_id => @group.id }
      # 件数が増えているかどうか確認する
      it { expect{ subject }.to change(User, :count).by(1) }
      it { should be_redirect }
    end

    context 'validation errorになった場合' do
      subject { post :create,:company_id => @company.id, :user => {"name" => "", "tel" => "1111-222-333", "mail" => "hogehoge"}, :group_id => @group.id }
      # 件数が増えているかどうか確認する
      it { expect{ subject }.to_not change(User, :count) }
      # it { should render_template(:new) }でも可能
      it { should render_template(:new) }
    end
  end

  describe " GET :show" do
    subject { get :show, id: 1 ,:company_id => @company.id,:group_id => @group.id } 
    it {

      # Post.should_receive(:find).with('1').and_return(Post.new(title: "hoge", body: "body"))
      # 以下の２行は上の行でも書ける
      obj = FactoryGirl.create(:user_1)
      obj.id = 1
      User.should_receive(:find).with("1").and_return(obj)

      should be_success
    }
  end
end
