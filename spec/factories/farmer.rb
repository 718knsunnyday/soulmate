FactoryBot.define do
  factory_bot :farmer do
    last_name {"農家"}
    first_name {"太郎"}
    last_name_kana {"ノウカ"}
    first_name_kana {"タロウ"}
    email {"noukataro@sample.com"}
    password {"noukataro"}
    password_confirmation {"noukataro"}
    end
end