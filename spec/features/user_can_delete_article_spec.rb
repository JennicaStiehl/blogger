require 'rails_helper'
describe "when a user visits the show page" do
  describe "they see a button to delete the article" do
    it "removes the article and redirects to index page" do
      article_1 = Article.create!(title: "Test to remove", body: "delete an article")
      article_2 = Article.create!(title: "Test", body: "to remove an article")
      visit article_path(article_1)

      click_link "Delete"

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_2.title)
      expect(page).to_not have_content(article_1.title)
    end
  end
end
