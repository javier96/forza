class MembersController < ApplicationController
  before_action :login_required, only: [:index, :edit, :update, :destroy]
  # GET /members
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  # GET /members
  # GET /members.json
  def index
    puts "SESSSSSSSSIOOOOOOOOOON"
    puts session[:admin]
    puts session[:current_user]
    if params[:query].present?
      @members = Member.search(params[:query])
    else
      @members = Member.all
    end
  end

  def innactive
    @members = @members.select{ |member| member.active }
    render(
      partial: 'list',
      locals: { members: @members }
    )
  end

  def upcoming_payments
    @allMembers = Member.all
    @members = []
    @allMembers.each do |m|
      puts Date.today + 14
      if m.nextPaymentDate <= Date.today + 14
        @members << m
      end
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @payments = Payment.where(member_id: @member.id)
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Miembro exitosamente creado.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Miembro exitosamente editado.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Miembro exitosamente eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      session.inspect
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:firstName, :lastName, :email, :phoneNumber, :paymentDay, :active, :nextPaymentDate, :search)
    end
end
