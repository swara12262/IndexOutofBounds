class UserdetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_userdetail, only: [:show, :edit, :update, :destroy]

  # GET /userdetails
  # GET /userdetails.json
  def index


    @userdetails = Userdetail.all
    
    redirect_to questions_path
  end

  # GET /userdetails/1
  # GET /userdetails/1.json
  def show
    @userdtl = Userdetail.all
    @userid=params[:user_id]
    @projects = Project.where(:user_id=>@userdetail.user_id)
    @project = Project.new
    @questions=Answer.all
    #@array=@userdetails.interests.split("")

  end

  # GET /userdetails/new
  def new
    @userdetail = Userdetail.new
    @subjects= Subject.all
  end

  # GET /userdetails/1/edit
  def edit
    @subjects= Subject.all
    @userdtl = Userdetail.all
    
  end

  # POST /userdetails
  # POST /userdetails.json
  def create
    @userdetail = Userdetail.new(userdetail_params)
    @userdetail.user_id=current_user.id
    respond_to do |format|
      if @userdetail.save
        format.html { redirect_to @userdetail, notice: 'Userdetail was successfully created.' }
        format.json { render :show, status: :created, location: @userdetail }
      else
        format.html { render :new }
        format.json { render json: @userdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userdetails/1
  # PATCH/PUT /userdetails/1.json
  def update
    respond_to do |format|
      if @userdetail.update(userdetail_params)
        format.html { redirect_to @userdetail, notice: 'Userdetail was successfully updated.' }
        format.json { render :show, status: :ok, location: @userdetail }
      else
        format.html { render :edit }
        format.json { render json: @userdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userdetails/1
  # DELETE /userdetails/1.json
  def destroy
    @userdetail.destroy
    respond_to do |format|
      format.html { redirect_to userdetails_url, notice: 'Userdetail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userdetail
      @userdetail = Userdetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userdetail_params
      params.require(:userdetail).permit(:image,:firstname, :lastname, :dateofbirth, :usertype,:qualification,:gender, :country, interests:[])
    end
end
