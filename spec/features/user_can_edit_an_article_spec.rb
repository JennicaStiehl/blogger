require 'rails_helper'
describe "when a user is at an article show page" do
  describe "they see an edit button" do
    it "allows them to change the article" do
      article_1 = Article.create!(title: "Test to remove", body: "delete an article")
      article_2 = Article.create!(title: "Test", body: "to remove an article")

      visit article_path(article_1)

      click_link("Edit this Article")

      expect(current_path).to eq(edit_article_path(article_1))
      fill_in "article[title]", with: "New Title!"
      fill_in "article[body]", with: "New Body"
      click_on "Submit"
    end
  end
end
