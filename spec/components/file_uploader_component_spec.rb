require "rails_helper"

describe FileUploaderComponent, type: :component do
  subject(:component) { described_class.new(key: key, redirect_url: "http://google.com") }

  let(:key) { 'key' }

  context 'when key is nil' do
    let(:key) { nil }

    it { expect(component.url).to be_nil }
  end

  it { expect(component.url).not_to be_nil }
end
