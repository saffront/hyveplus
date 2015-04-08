class BaseDecorator < SimpleDelegator
  include ActionView::Helpers

  def self.wrap(collection)
    collection.map do |object|
        new object
    end
  end

  def model
    #Return the current object method calls are being delegated to
    __getobj__
  end
end
