# frozen_string_literal: true

class LinkComponent < ViewComponent::Base
  attr_reader :url, :klass

  def initialize(url:, klass: [])
    @url = url
    @klass = Array.wrap(klass).join(" ")
  end

  def render?
    url
  end
end
