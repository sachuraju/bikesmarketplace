class Bike < ActiveRecord::Base

  validates_presence_of :brand
  validates_numericality_of :cost
  validate :cost_must_be_a_number

  protected
  def cost_must_be_a_number
    errors.add(:cost, "should be at least 0.01") if cost.nil? || cost < 0.01
  end
end