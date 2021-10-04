require 'rails_helper'
require 'support/capybara'

RSpec.describe "Events", type: :system do
  let(:admin) { create(:user, admin: true) }

  describe "イベント登録をする時" do
    before do
      sign_in admin
      visit new_event_path
    end

    context "全ての項目が正しく入力できている場合（新規登録）" do
      it "登録済みイベント一覧にリダイレクトし、登録完了のflashメッセージが表示されている" do
        fill_in('event[title]',        with: 'テストイベントの登録')
        fill_in('event[introduction]', with: 'テストイベントを登録しています')
        fill_in('event[start_time]',   with: "#{Date.today.beginning_of_week}")
        fill_in('event[end_time]',     with: "#{Date.today.end_of_week}")
        fill_in('event[entry_count]',  with: 10)
        fill_in('event[event_price]',  with: 300)
        fill_in('event[address]',      with: '東京都千代田区神田駿河台1-1')
        click_button('イベントを登録する')
        expect(current_path).to eq events_path
        expect(page).to have_content('イベント登録が完了しました')
      end
    end

    context "入力に誤りがある場合" do
      it "エラーのflashメッセージが表示されている" do
        fill_in('event[title]',        with: nil)
        fill_in('event[introduction]', with: 'テストイベントを登録しています')
        fill_in('event[start_time]',   with: "#{Date.today.beginning_of_week}")
        fill_in('event[end_time]',     with: "#{Date.today.end_of_week}")
        fill_in('event[entry_count]',  with: 10)
        fill_in('event[event_price]',  with: 300)
        fill_in('event[address]',      with: '東京都千代田区神田駿河台1-1')
        click_button('イベントを登録する')
        expect(current_path).to eq events_path
        expect(page).to have_content('入力に誤りがあります。')
      end
    end

    context "前の画面（マイページ）に戻る場合" do
      it "自身のページに戻ることができている" do
        within(:css, '.mypage-link') do
          click_link('マイページ')
        end
        expect(current_path).to eq user_path(admin.id)
        expect(page).to have_text("#{admin.name} さん")
      end
    end
  end

  describe "登録済みイベントを編集する時" do
    let(:admin) { create(:user, admin: true) }
    let(:event) { create(:event, user_id: admin.id) }

    before do
      sign_in admin
      visit edit_event_path(event.id)
    end

    context "全ての項目が正しく入力できている場合（編集）" do
      it "登録済みイベント一覧にリダイレクトし、編集完了のflashメッセージが表示されている" do
        fill_in('event[address]',      with: '京都府京都市北区等持院北町５６−１')
        click_button('イベントを変更する')
        expect(current_path).to eq events_path
        expect(page).to have_content('イベントを更新しました')
        expect(event.reload.address).not_to eq "東京都千代田区神田駿河台1-1"
        expect(event.address).to eq "京都府京都市北区等持院北町５６−１"
      end
    end

    context "入力に誤りがある場合" do
      it "エラーのflashメッセージが表示されている" do
        fill_in('event[title]',        with: nil)
        fill_in('event[address]',      with: '京都府京都市北区等持院北町５６−１')
        click_button('イベントを変更する')
        expect(current_path).to eq "/events/#{event.id}"
        expect(page).to have_content('入力に誤りがあります。')
        expect(event.reload.address).to eq "東京都千代田区神田駿河台1-1"
        expect(event.address).not_to eq "京都府京都市北区等持院北町５６−１"
      end
    end

  context "前の画面（イベント一覧ページ）に戻る場合" do
      it "自身のページに戻ることができている" do
        within(:css, '.event-index-link') do
          click_link('イベント一覧ページ')
        end
        expect(current_path).to eq events_path
        expect(page).to have_text("登録済みイベント一覧")
      end
    end
  end

  # describe "登録済みイベントを削除する時" do
  #   let(:admin) { create(:user, admin: true) }
  #   let(:event) { create(:event, user_id: admin.id) }

  #   before do
  #     sign_in admin
  #     visit events_path
  #   end

  #   context "削除ボタンを押下した場合" do
  #     scenario "確認ダイアログが表示されている" do
  #       click_on('削除')
  #       find('a', text: '削除').click
  #       expect(page.driver.browser.switch_to.alert.text).to eq "イベントを削除します。よろしいですか?"
  #       page.driver.browser.switch_to.alert.dismiss
  #     end
  #   end

  #   context "確認ダイアログでOKを押下した場合" do
  #     it "対象のイベントが削除されている" do
  #     end

  #     it "登録済みイベント一覧にリダイレクトし、flashメッセージが表示されている" do
  #     end
  #   end
  # end
end
