require 'rails_helper'

RSpec.describe "Api::V1::Articles", type: :request do
  describe "GET /articles" do
    subject { get(api_v1_articles_path)}
    let(:article1){ create(:article, updated_at: 1.days.ago)}
    let(:article2){ create(:article, updated_at: 2.days.ago)}
    let(:article3){ create(:article)}
    fit "記事一覧が取得できる" do
      subject
      res = JSON.parse(response.body)
      binding.pry

      expect(response).to have_http_status(:ok)
      expect(res.length).to eq 3
    end
  end
end
