# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { "MyString" }
    body { "MyText" }
    published_at { "2022-11-11 17:32:56" }
  end
end
