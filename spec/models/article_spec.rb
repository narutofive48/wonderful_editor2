require "rails_helper"
RSpec.describe Article, type: :model do
  context "必要な情報が揃っているとき" do
    it "articleがつくられる" do
      article = Article.new(id: 1,title: "test_title", body: "test_body", user_id: 1)
      expect(article).to be_valid
    end
  end
  context "user_idが入っていないとき" do
    it "articleが作られない" do
      article = Article.new(id: 1,title: "test_title", body: "test_body", user_id: nil)
      expect(article).to be_invalid
    end
  end
end
