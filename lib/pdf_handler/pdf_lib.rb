module PdfHandler
  class PdfLib
    def self.call(*args, &block)
      new(*args, &block).call
    end
  end
end

