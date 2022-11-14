# frozen_string_literal: true

require "rails_helper"

RSpec.describe "posts/show", type: :view do
  before do
    assign(:post, Post.create!(
                    title: "Title",
                    body: "MyText"
                  ))
  end

  it "renders attributes in <p>", :aggregate_failures do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
