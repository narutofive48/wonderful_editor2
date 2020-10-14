require "rails_helper"
RSpec.describe Article, type: :model do
  context "必要な情報が揃っているとき" do
    it "articleがつくられる" do
      article = FactoryBot.build(:article)
      # article = Article.new(id: 1,title: "test_title", body: "test_body", user_id: 1)
      expect(article).to be_valid
    end
  end
  context "titleが入ってないとき" do
    let(:article){FactoryBot.build(:article, title: nil)}
    fit "articleはつくられない" do
      # article = FactoryBot.build(:article, title: nil)
      expect(article).to be_invalid
    end
  end
  context "bodyeが入ってないとき" do
    it "articleはつくられる" do
      article = FactoryBot.build(:article, body: nil)
      expect(article).to be_valid
    end
  end
end
