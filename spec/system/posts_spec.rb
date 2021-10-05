require 'rails_helper'
require 'support/capybara'

RSpec.describe "Posts", type: :system do
  describe "連絡事項からコメントを投稿する時" do
    let!(:user) { create(:user) }
    let!(:admin) { create(:user, admin: true) }
    let!(:event) { create(:event, user_id: admin.id) }
    let!(:entry) { create(:entry, user_id: user.id, event_id: event.id) }

    before do
      sign_in user
      visit user_entry_path(user.id, entry.id)
    end

    context "予約内容画面上で全ての項目が正しく入力できている場合" do
      it "flashメッセージが表示され、投稿履歴に自身が投稿した内容が表示されている" do
        fill_in('post[subject]', with: 'テストコメント')
        fill_in('post[comment]', with: 'テストコメントを投稿しています')
        click_button('投稿する')
        expect(current_path).to eq user_entry_path(user.id, entry.id)
        expect(page).to have_content('コメントを投稿しました')
        expect(page).to have_content('テストコメント')
        expect(page).to have_content('テストコメントを投稿しています')
      end
    end

    context "入力に誤りがある場合" do
      it "エラーメッセージが表示されている" do
        fill_in('post[subject]', with: 'テストコメント')
        fill_in('post[comment]', with: nil)
        click_button('投稿する')
        expect(current_path).to eq user_entry_path(user.id, entry.id)
        expect(page).to have_content('件名、もしくは投稿内容を入力してください')
      end
    end
  end
end
