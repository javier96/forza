class ApplicationController < ActionController::Base
  def login_required
    puts "SESSSSSSSSIOOOOOOOOOON SESSSSSSSSIOOOOOOOOOON SESSSSSSSSIOOOOOOOOOONSESSSSSSSSIOOOOOOOOOON SESSSSSSSSIOOOOOOOOOON"
    puts session.inspect
    redirect_to('/pages/home') unless session[:current_user] == "FORZA"
  end
end
