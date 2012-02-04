class Admin::ReviewsController < Spree::Admin::ResourceController
  #require_role "admin" # You might want to remove this, and add security in the /config/easy_role_permissions.yml file
  layout 'admin'

  before_filter :index_before, :only => [:index]

  #create.response do |wants|
  #  wants.html { redirect_to admin_reviews_path }
  #end
  #
  #update.response do |wants|
  #  wants.html { redirect_to admin_reviews_path }
  #end

  def approve
    r = Review.find(params[:id])

    r.approved = true
    if r.product.rating.nil? 
      r.product.rating = Rating.create :value => 0, :count => 0
    end
    r.product.rating.add_rating(r.rating)

    if r.save
       flash[:notice] = t("info_approve_review")
    else
       flash[:error] = t("error_approve_review")
    end
    redirect_to admin_reviews_path
  end

  protected
  def index_before
    @unapproved_reviews = Review.not_approved.find(:all, :order => "created_at DESC")
    @approved_reviews   = Review.approved.find(:all, :order => "created_at DESC")
  end
end
