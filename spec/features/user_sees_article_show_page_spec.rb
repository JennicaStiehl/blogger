require 'rails_helper'
describe "user sees one article" do
  describe "they link from the articles index" do
    it "displays info for one article" do
      article_1 = Article.create!(title: "Fun with rails", body: "all the directories!")

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end
