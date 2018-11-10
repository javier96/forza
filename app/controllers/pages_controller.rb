class PagesController < ApplicationController
  def home
  end


  def login
    user = params[:pages][:email]
    password = params[:pages][:password]
    if user == "f@f.f" && password == "Forza123"
      session[:admin] = true
      redirect_to controller: 'members', action: 'upcoming_payments'
    end
    @member = Member.find_by(email:user)
    if !@member.nil?
      num = @member.phoneNumber
      num = num[num.length-4, 4]
      if num == password
        redirect_to @member
      end
    end
    flash[:error] = "Wrong credentials"
  end

  private

  def pages_params
    params.permit(:email, :password)
  end
end
