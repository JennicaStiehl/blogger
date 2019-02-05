require 'rails_helper'
describe "user see all articles" do
  describe "they visit /articles" do
    it "displays all articles" do
      article_1 = Article.new(title: "Title 1", body: "body 1")
      article_2 = Article.new(title: "Title 2", body: "body 2")

      visit articles_path

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_2.title)
    end
  end
end
