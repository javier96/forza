class PagesController < ApplicationController
  def home
  end

  def create
    user = params[:email]
    password = params[:password]
    if user == "adminForza" && password == "Forza123"
      session[:admin] = true
      render :template => 'payments/upcoming_payments'
    end
    @member = Member.find_by(email: params[:email])
    if !@member.nil?
      num = @member.phoneNumber
      num = num[num.length-4, 4]
      if num == params[:password]
        render :template => 'members/show', id: @member.id
      end
    end
    flash[:error] = "Wrong credentials"
  end
  def login
    render 'login'
    puts "ADSADSDASDASDASDASDASDASD"
    user = params[:pages][:email]
    password = params[:pages][:password]
    puts user
    puts password
    if user == "adminForza@f.f" && password == "Forza123"
      session[:admin] = true
      redirect_to controller: 'members', action: 'upcoming_payments'
    end
    @member = Member.find_by(email: user)
    puts @member.inspect
    if !@member.nil?
      num = @member.phoneNumber
      num = num[num.length-4, 4]
      if num == password
        redirect_to @member
      end
    flash[:notice] = "Wrong credentials"
    end
    flash[:notice] = "Wrong credentials"
  end

  private

  def pages_params
    params.permit(:email, :password)
  end
end
