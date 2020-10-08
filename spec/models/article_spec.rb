require "rails_helper"

RSpec.describe Article, type: :model do
  context "必要な情報が揃っている場合" do
    let(:user) { build(:user) }
    it "article登録できる" do
      expect(article).to be_valid
    end
  end
end
