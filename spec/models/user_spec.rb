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

require 'rails_helper'

RSpec.describe User, :type => :model do

  it "should return an insurance value per the quote calculation" do

    user = User.new(
    :name => "Gerry",
    :annual_income => 100000,
    :current_savings => 50000,
    :retirement_savings => 20000
    )
    expect(user.get_quote).to eq(670000)

  end
end
