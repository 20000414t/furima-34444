FactoryBot.define do
  factory :user do
    name              {"tarou"}
    email                 {"sample@gmail.com"}
    password              {"1234567"}
    encrypted_password    {"1234567"}
    name_family           {"山田"}
    name_family_kana      {"ヤマダ"}
    name_first            {"太郎"}
    name_first_kana       {"タロウ"}
    birthday             {"2000-01-01"}
  end
end