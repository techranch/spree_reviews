class Review < ActiveRecord::Base
  belongs_to :product, class_name: 'Spree::Product'
  belongs_to  :user, class_name: 'Spree::User'

  validates_presence_of :review
  validates_presence_of :user_id, :title, :review
  validates_numericality_of :rating, :only_integer => true

  scope :approved,     lambda {|*args| {:conditions => "approved = 't'"}}   
  scope :not_approved, lambda {|*args| {:conditions => "approved = 'f'"}} 

  scope :approval_filter, lambda {|*args| {:conditions => ["(? = 't') || (approved = 't')", Spree::Reviews::Config[:include_unapproved_reviews]]}} 

  scope :oldest_first, :order => "created_at asc"
  scope :preview,      :limit => Spree::Reviews::Config[:preview_size], :order=>"created_at desc"

end
