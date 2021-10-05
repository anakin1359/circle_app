require 'rails_helper'
require 'support/capybara'

RSpec.describe "Entries", type: :system do  
  describe "イベントに参加する時" do
    let(:user) { create(:user) }
    let(:admin) { create(:user, admin: true) }
    let(:event) { create(:event, user_id: admin.id) }

    before do
      sign_in user
      # visit new_event_entry_path(event.id)
    end

    # context "イベント詳細から予約画面に進む場合" do
    #   it "画面遷移が正しく行われている" do
    #     visit user_event_path(user.id, event.id)
    #     within(:css, '.actions') do
    #       click_link('このイベントに参加する')
    #     end
    #     expect(current_path).to eq new_event_entry_path(event.id)
    #     expect(page).to have_text("イベント予約")
    #   end
    # end

    # context "予約画面上で参加者の人数を入力した場合" do
    #   it "参加者の人数に応じた参加料金が自動計算されている" do
        
    #   end
    # end

    context "全ての項目が正しく入力できている場合" do
      scenario '予約履歴一覧にリダイレクトし、flashメッセージが表示されている', js: true do
        visit new_event_entry_path(event.id)
        fill_in('entry[entry_name]',  with: 'テストエントリー')
        fill_in('entry[entry_count]', with: 3)
        sleep 1
        click_button('イベントに参加する')
        # expect(current_path).to eq user_entries_path(user.id)
        expect(current_path).to eq "/events/#{event.id}/entries/"
        expect(page).to have_content('イベントを更新しました')
        expect(page).to have_content('イベント予約が完了しました')
      end
    end

    # context "入力に誤りがある場合" do
    #   it "エラーメッセージが表示されている" do
        
    #   end
    # end

    # context "前の画面（イベント詳細ページ）に戻る場合" do
    #   it "イベント詳細ページに戻ることができている" do
    #     visit new_event_entry_path(event.id)
    #     within(:css, '.entry-link') do
    #       click_link('イベント詳細ページに戻る')
    #     end
    #     expect(current_path).to eq user_event_path(user.id, event.id)
    #     expect(page).to have_text("イベント詳細")
    #   end
    # end
  end
end
