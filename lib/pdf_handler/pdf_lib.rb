module PdfHandler
  class PdfLib
    CUSTOM_TIMESTAMP = Time.now.strftime("%Y%m%d_%H%M%S").freeze

    def self.call(*args, &block)
      new(*args, &block).call
    end
  end
end

