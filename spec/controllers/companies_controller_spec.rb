require 'spec_helper'

describe CompaniesController do
  # viewの検証までする
  render_views
  describe " GET :index" do
    subject { get :index }
    it { should be_success }
  end

  describe " GET :new" do
    subject { get :new }
    it { should be_success }
  end

  describe " POST :create" do
    context '保存に成功した場合' do
      subject { post :create, :company => { "name" => "hoge", "adress" =>  "body", "tel" => "0050-111-2222", "fax" => "0003-111-1111", "url" =>  "http://example.com"} }
      # 件数が増えているかどうか確認する
      it { expect{ subject }.to change(Company, :count).by(1) }
      it { should be_redirect }
    end

    context 'validation errorになった場合' do
      subject { post :create, :company => { "name" =>  "hoge", "adress" =>  "body", "tel" => "000-1111-2222", "fax" =>  "03-1111-1111", "url" => "http://example.com"} }
      # 件数が増えているかどうか確認する
      it { expect{ subject }.to_not change(Company, :count) }
      # it { should render_template(:new) }でも可能
      it { should render_template("new") }
    end
  end

  describe " GET :show" do
    subject { get :show, id: 1 }
    it {

      # Post.should_receive(:find).with('1').and_return(Post.new(title: "hoge", body: "body"))
      # 以下の２行は上の行でも書ける
      obj = FactoryGirl.create(:company_1)
      obj.id = 1
      Company.should_receive(:find).with("1").and_return(obj)
      should be_success
    }
  end
end
