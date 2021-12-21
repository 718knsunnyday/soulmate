FactoryBot.define do
  factory_bot :public do
    last_name {"山田"}
    first_name {"太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    email {"yamadataro@sample.com"}
    password {"yamadataro"}
    password_confirmation {"yamadataro"}
    end
end

