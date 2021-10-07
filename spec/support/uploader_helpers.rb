# frozen_string_literal: true

module UploaderHelpers
  def sample_image
    Rack::Test::UploadedFile.new(Rails.root.join('spec/attachments/sample_image.png'))
  end

  def sample_pdf
    Rack::Test::UploadedFile.new(Rails.root.join('spec/attachments/sample_pdf.pdf'))
  end
end
