class ProjectsController < ApplicationController
   before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.where(:user_id=>params[:user_id])
    @userdtl = Userdetail.all
    @user = Userdetail.find(params[:user_id])
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project= Project.find(params[:id])
    @userdtl = Userdetail.all

  end

  # GET /projects/new
  def new
   # @userdtl = Userdetail.all
    @project = Project.new


    

  end

  # GET /projects/1/edit
  def edit
    @userdtl = Userdetail.all
  end

  # POST /projects
  # POST /projects.json
  def create
    @userdtl = Userdetail.all
    @project = Project.new(project_params)
    @project.user_id=current_user.id

       if @project.save
        redirect_to userdetail_path(current_user.id)
        
      else
        render 'new'
      end
  
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to userdetail_path(current_user.id), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to userdetail_path(current_user.id), notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :technology, :description, :githublink,:user_id)
    end
end
