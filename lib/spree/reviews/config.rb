module Spree::Reviews
  class Config < Spree::Preferences::Configuration
    include Singleton
    preference :preview_size, :integer, default: 5
    preference :include_unapproved_reviews, :boolean, default: false

    def self.[] key
      self.send key
    end

    def self.method_missing (method_name, params= {})
      begin
        self.instance.send method_name
      rescue NoMethodError => e
        raise NoMethodError.new("Spree::ReviewsConfig preference #{method_name} is not defined")
      end
    end

  end
end