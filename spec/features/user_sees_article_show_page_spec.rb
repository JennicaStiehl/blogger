require 'rails_helper'
describe "user sees one article" do
  before :each do
    @article_1 = Article.create!(title: "Fun with rails", body: "i love all the directories!")
    @comment_1 = @article_1.comments.create!(author_name: "Eric", body: "keep up the good work")
    @comment_2 = @article_1.comments.create!(author_name: "Pynn", body: "keep it up")
  end
  describe "they link from the articles index" do
    it "displays info for one article" do

      visit articles_path

      click_link @article_1.title

      expect(page).to have_content(@article_1.title)
      expect(page).to have_content(@article_1.body)
      expect(page).to have_content(@comment_1.author_name)
      expect(page).to have_content(@comment_1.body)
      expect(page).to have_content(@comment_2.author_name)
      expect(page).to have_content(@comment_2.body)
    end
  end
  describe "they fill in a comment form" do
    it "displays the comment on the article show page" do

      visit article_path(@article_1)

      fill_in "comment[author_name]", with: "me"
      fill_in "comment[body]", with: "so many thoughts."
      click_on "Submit"

      expect(current_path).to eq(article_path(@article_1))
      expect(page).to have_content("Post a Comment")
      expect(page).to have_content("me")
      expect(page).to have_content("so many thoughts.")
      expect(page).to have_content("Comments (#{@article_1.comments.size})")
    end
  end
end
