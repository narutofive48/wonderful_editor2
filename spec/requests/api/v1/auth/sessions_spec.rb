require "rails_helper"
RSpec.describe "Api::V1::Auth::Sessions", type: :request do
  describe "POST /v1/auth/sign_in" do
    subject { post(api_v1_user_session_path, params: params) }
    context "必要な情報が存在するとき" do
      let(:params){ attributes_for(:user) }
      it "ユーザーの新規登録ができる" do
        expect { subject }.to change { User.count }.by(1)
        expect(response).to have_http_status(:ok)
        res = JSON.parse(response.body)
        expect(res["data"]["email"]).to eq(User.last.email)
      end
      it "header 情報を取得することができる" do
        subject
        header = response.header
        binding.pry
        expect(header["access-token"]).to be_present
        expect(header["client"]).to be_present
        expect(header["expiry"]).to be_present
        expect(header["uid"]).to be_present
        expect(header["token-type"]).to be_present
      end
    end
    context "nameが存在しないとき" do
      let(:params){ attributes_for(:user, name: nil) }
      it "エラーする" do
        expect{ subject }.to change { User.count }.by(0)
        res = JSON.parse(response.body)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(res["errors"]["name"]).to include "can't be blank"
      end
    end
    context "emailが存在しないとき" do
      let(:params){ attributes_for(:user, email: nil) }
      it "エラーする" do
        expect{ subject }.to change { User.count }.by(0)
        res = JSON.parse(response.body)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(res["errors"]["email"]).to include "can't be blank"
      end
    end
  end
end
