FactoryBot.define do
  factory :user do
    name              {"tarou"}
    email                 {"sample1@gmail.com"}
    password              {"1234567"}
    encrypted_password    {"1234567"}
    name_family           {"山田"}
    name_family_kana      {"ヤマダ"}
    name_first            {"二郎"}
    name_first_kana       {"ジロウ"}
    birthday             {"2000-01-01"}
  end
end