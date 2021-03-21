require "rails_helper"

describe LinkComponent, type: :component do
  subject(:component) { described_class.new(url: url, klass: klass) }

  let(:url) { "http://google.com/" }
  let(:klass) { "some-class" }

  before { render_inline component }

  context "when url is nil" do
    let(:url) { nil }

    it "should not render anything" do
      expect(page).not_to have_css("div.button-group")
    end
  end

  it { expect(page).to have_css("div.button-group.#{ klass }") }
  it { expect(page.find("input[name=url]").value).to eq(url) }
end
