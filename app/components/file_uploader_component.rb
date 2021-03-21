# frozen_string_literal: true

class FileUploaderComponent < ViewComponent::Base
  attr_reader :key, :bucket_name, :redirect_url

  def initialize(key:,
                 redirect_url:,
                 bucket_name: Rails.application.credentials[:aws][:bucket])
    @key = key
    @bucket_name = bucket_name
    @redirect_url = redirect_url
  end

  def url
    return unless key

    @url ||= bucket.object(key).presigned_url(:get)
  end

  def form
    @form ||= bucket.presigned_post(
      key: "#{ SecureRandom.uuid }-${filename}",
      success_action_redirect: redirect_url
    )
  end

  private

  def bucket
    @bucket ||= begin
                  resource = Aws::S3::Resource.new
                  resource.bucket(bucket_name)
                end
  end
end
