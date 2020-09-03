FactoryBot.define do
  factory :user do
    nickname              {"aaa"}
    email                 {"aaa@gmail.com"}
    password              {"aaa111"}
    password_confirmation {password}
    first_name            {"誠也"}
    family_name           {"鈴木"}
    first_name_kana       {"セイヤ"}
    family_name_kana      {"スズキ"}
    birthday              {"1997/01/01"}
  end
end
