# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'


module SpreeReviews

  class Engine < Rails::Engine
    engine_name 'spree_reviews'

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/overrides/**/*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end


#class ReviewsExtension < Spree::Extension
#  version "1.0"
#  description "Support for reviews and ratings within Spree"
#  url "git://github.com/paulcc/spree-reviews.git"
#
#  def activate
#    # admin.tabs.add "Reviews", "/admin/reviews", :after => "Layouts", :visibility => [:all]
#
#    Admin::ConfigurationsController.class_eval do
#      before_filter :add_review_links, :only => :index
#
#      def add_review_links
#        @extension_links << {:link => admin_reviews_path, :link_text => t('review_management'), :description => t('review_management_description')}
#        @extension_links << {:link => admin_review_settings_path, :link_text => t('reviews.review_settings'), :description => t('reviews.manage_review_settings') }
#      end
#    end
#
#    # Add access to reviews/ratings to the product model
#    Product.class_eval do
#      has_one :rating
#      has_many :reviews
#
#      def get_stars
#        if rating.nil? 
#          [0,0]
#        else
#          [rating.get_stars, rating.count]
#        end
#      end
#    end
#  end
#  
#  def deactivate
#    # admin.tabs.remove "Reviews"
#  end
#  
#end
