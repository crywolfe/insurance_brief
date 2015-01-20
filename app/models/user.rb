# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string
#  annual_income      :float
#  current_savings    :float
#  retirement_savings :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class User < ActiveRecord::Base

  validates :name, presence: { message: '- Please provide your name' }
  validates :annual_income, numericality: { message: '- Please provide your annual income as a number' }
  validates :current_savings, numericality: { message: '- Please provide your current savings as a number' }
  validates :retirement_savings, numericality: { message: '- Please provide your retirement savings as a number' }

  # def initialize
  #   @tax_rate = 0.30
  # end

  def get_quote
    tax_rate = 0.30

    10 * self.annual_income * (1 - tax_rate) - self.current_savings + self.retirement_savings

  end


end
