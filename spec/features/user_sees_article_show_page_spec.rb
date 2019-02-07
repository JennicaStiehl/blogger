require 'rails_helper'
describe "user sees one article" do
  describe "they link from the articles index" do
    it "displays info for one article" do
      article_1 = Article.create!(title: "Fun with rails", body: "all the directories!")
      comment_1 = article_1.comments.create!(author_name: "Eric", body: "keep up the good work")
      comment_2 = article_1.comments.create!(author_name: "Pynn", body: "keep it up")

      visit articles_path

      click_link article_1.title

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
    end
  end
end
