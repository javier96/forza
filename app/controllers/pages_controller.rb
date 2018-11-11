class PagesController < ApplicationController
  def home
  end

  def logout
    session[:current_user] = ""
    redirect_to controller: "pages", action: "home"
  end

  def authen
    puts "ADASDASDASDASDASDA"
    params.inspect
    user = params[:pages][:email]
    password = params[:pages][:password]
    if user == "f@f.f" && password == "123"
      session[:current_user] = "FORZA"
      redirect_to controller: 'members', action: 'upcoming_payments'
      return
    end
    @member = Member.find_by(email:user)
    if !@member.nil?
      num = @member.phoneNumber
      num = num[num.length-4, 4]
      if num == password
        redirect_to @member
        return
      end
    end
    redirect_to pages_login_path, notice: 'Credenciales no validas'
  end

  def login
  end

  private

  def pages_params
    params.permit(:email, :password)
  end
end
