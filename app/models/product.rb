class Product < ActiveRecord::Base
  validates :title, :description, :price, presence: true
  validates :title, uniqueness: true
  validates_length_of :title, minimum: 6, message: "at least 6 characters" 
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: true, format: {
    with: /\.(gif|bmp)\z/i,
    message: 'must be either gif or bmp'
  }
  
  def self.latest
    Product.order(:updated_at).last
  end
end
