FactoryBot.define do
  factory :purchase_address do
    # card_number { '4242424242424242' }
    # card_cvd { '123' }
    # card_exp_month { '3' }
    # card_exp_year { '23' }
    # ↑の記述が必要ないのは、これらの代わりにトークンを用意しているから。
    token {'aaaaaaaaaaaaaaaaa'}
    # カード情報を入力しない代わりにトークンを発行する。カード情報はPayJPに送られた後、トークンとしてサーバーへ返却される。
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '青山1-1' }
    building { '柳ビル103' }
    phone_number { '09012345678'}
    association :item
  end
end
