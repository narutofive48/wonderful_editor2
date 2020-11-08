require "rails_helper"
RSpec.describe "Api::V1::Articles", type: :request do
  describe "POST /articles" do
    subject { post(api_v1_articles_path, params: params)}
    let(:params){ {article: attributes_for(:article) } }
    let(:current_user){ create(:user) }
    before { allow_any_instance_of(Api::V1::BaseApiController).to receive(:current_user).and_return(current_user)}
    fit "記事のレコードが作成できる" do
      expect { subject }.to change { Article.where(user_id: current_user.id).count }.by(1)
      res = JSON.parse(response.body)
      expect(res["title"]).to eq params[:article][:title]
      expect(res["body"]).to eq params[:article][:body]
      expect(response).to have_http_status(:ok)
    end
  end
end
