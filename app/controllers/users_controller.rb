class UsersController < ApplicationController
  before_action :set_user, only: [:show]


  def show
    @user = User.find(params[:id])
    @annual_income = @user.annual_income
    @user.get_quote

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        console
        format.html { redirect_to @user, notice: 'Information was successfully saved.' }
        format.json { render :show, status: :created, location: @user }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js { }

      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :annual_income, :current_savings, :retirement_savings)
    end
end
