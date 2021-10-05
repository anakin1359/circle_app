require 'rails_helper'
require 'support/capybara'

RSpec.describe "Entries", type: :system do  
  describe "イベントに参加する時" do
    let(:user) { create(:user) }
    let(:admin) { create(:user, admin: true) }
    let(:event) { create(:event, user_id: admin.id) }

    before do
      sign_in user
    end

    context "イベント詳細から予約画面に進む場合" do
      it "画面遷移が正しく行われている" do
        visit user_event_path(user.id, event.id)
        within(:css, '.actions') do
          click_link('このイベントに参加する')
        end
        expect(current_path).to eq new_event_entry_path(event.id)
        expect(page).to have_text("イベント予約")
      end
    end

    context "全ての項目が正しく入力できている場合（新規登録：JSあり）" do
      it "予約履歴一覧にリダイレクトし、flashメッセージが表示されている", js: true do
        visit new_event_entry_path(event.id)
        fill_in('entry[entry_name]',  with: 'テストエントリー')
        fill_in('entry[entry_count]', with: 3)
        sleep 0.5
        click_button('イベントに参加する')
        expect(current_path).to eq user_entries_path(user.id)
        expect(page).to have_content('イベント予約が完了しました')
      end
    end

    context "入力に誤りがある場合" do
      it "エラーメッセージが表示されている", js: true do
        visit new_event_entry_path(event.id)
        fill_in('entry[entry_name]',  with: nil)
        fill_in('entry[entry_count]', with: 3)
        sleep 0.5
        click_button('イベントに参加する')
        expect(current_path).to eq "/events/#{event.id}/entries/"
        expect(page).to have_content('入力に誤りがあります。')
      end
    end

    context "前の画面（イベント詳細ページ）に戻る場合" do
      it "イベント詳細ページに戻ることができている" do
        visit new_event_entry_path(event.id)
        within(:css, '.entry-link') do
          click_link('イベント詳細ページに戻る')
        end
        expect(current_path).to eq user_event_path(user.id, event.id)
        expect(page).to have_text("イベント詳細")
      end
    end
  end

  describe "予約履歴を確認する時" do
    let!(:user) { create(:user) }
    let!(:admin) { create(:user, admin: true) }
    let!(:event) { create(:event, user_id: admin.id) }
    let!(:entry) { create(:entry, user_id: user.id, event_id: event.id) }

    before do
      sign_in user
    end
    
    context "予約履歴一覧にアクセスした場合" do
      it "予約したイベントが一覧に存在している" do
        visit user_entries_path(user.id)
        expect(page).to have_text("test_event")
      end
    end

    context "前の画面（予約履歴一覧）に戻る場合" do
      it "予約履歴一覧ページ上に戻ることができている" do
        visit user_entry_path(user.id, entry.id)
        within(:css, '.entry-index-link') do
          click_link('予約一覧ページに戻る')
        end
      end
    end
  end

  describe "予約内容をキャンセルする場合" do
    let!(:user) { create(:user) }
    let!(:admin) { create(:user, admin: true) }
    let!(:event) { create(:event, user_id: admin.id) }
    let!(:entry) { create(:entry, user_id: user.id, event_id: event.id) }

    before do
      sign_in user
    end

    context "予約内容ページから「このイベントをキャンセルする」を押下した場合" do
      before do
        visit user_entry_path(user.id, entry.id)
      end

      it "確認ダイアログが表示されている", js: true do
        page.dismiss_confirm("イベントをキャンセルします。よろしいですか?")  do
          click_on('このイベントをキャンセルする')
        end
      end

      it "予約履歴一覧ページにリダイレクトし、flashメッセージが表示されている", js: true do
        page.accept_confirm do
          click_on('このイベントをキャンセルする')
        end
        sleep 0.5
        expect(current_path).to eq user_entries_path(user.id)
        expect(page).to have_content('予約を取り消しました')
        expect(page).not_to have_text("test_event")
      end
    end
  end
end
