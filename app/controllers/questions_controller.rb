class QuestionsController < ApplicationController
 before_action :authenticate_user!
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  # GET /questions
  # GET /questions.json
  def index

    @questions =Question.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @userdtl = Userdetail.all
    @subjects = Subject.all
     if !Userdetail.exists?(user_id: current_user.id) 
        redirect_to new_userdetail_path 
      end
    @newquestions =Question.last(5).reverse

    @cnt=Answer.where(:user_id =>current_user.id).count
    @unanswered=Question.all.count-@cnt

  end



 def myquestionsindex
    @questions = Question.all
    @userdtl = Userdetail.all
    @subjects = Subject.all
    if !Userdetail.exists?(user_id: current_user.id) 
        redirect_to new_userdetail_path 
    end

    @newquestions =Question.last(5).reverse
    @cnt=Answer.where(:user_id =>current_user.id).count
  end


 def interestwisequestions
    @questions = Question.paginate(:page => params[:page], :per_page => 10)
       @userdtl = Userdetail.all
       @subjects = Subject.all
       @sub = params[:subjectname]
     if !Userdetail.exists?(user_id: current_user.id) 
        redirect_to new_userdetail_path 
      end

    @newquestions =Question.last(5).reverse
    @cnt=Answer.where(:user_id =>current_user.id).count
  end



  def changetext
    @questions =Question.all
    @answers = Answer.all
    @userdtl = Userdetail.all
    @subjects = Subject.all
    @userq = params[:userquestion]
    @result = ""
    require 'open3'
    @questions.each do | que |
        cmd = 'echo "'+que.userquestion+'" | grep -i "'+@userq+'"' 
        stdin, @stdout, stderr, wait_thr = Open3.popen3(cmd)
        @result = @result + @stdout.read 
        end
  
      
    respond_to do | format |
        format.js
      end
  end


def searchtext
    @questions =Question.all
    @answers = Answer.all
    @userdtl = Userdetail.all
    @subjects = Subject.all
    @userq = params[:q]
    @result = ""
    require 'open3'
    @questions.each do | que |
        cmd = 'echo "'+que.userquestion+'" | grep -i "'+@userq+'"' 
        stdin, @stdout, stderr, wait_thr = Open3.popen3(cmd)
        @result = @result + @stdout.read 
    end
  
  @userdtl.each do | dtl |
        cmd = 'echo "'+dtl.firstname+' '+dtl.lastname+'" | grep -i "'+@userq+'"' 
        stdin, @stdout, stderr, wait_thr = Open3.popen3(cmd)
        @result = @result +  @stdout.read 
    end
  

    respond_to do | format |
        format.js
      end
  end





  
  def answeredque
     @questions = Question.paginate(:page => params[:page], :per_page => 10)
    @answers = Answer.all
       @userdtl = Userdetail.all
       @subjects = Subject.all
       @likes=Like.all
       @dislikes = Dislike.all
     if !Userdetail.exists?(user_id: current_user.id) 
        redirect_to new_userdetail_path 
      end

    @newquestions =Question.last(5).reverse
    @cnt=Answer.where(:user_id =>current_user.id).count
   @answerd_questions=Answer.where(:user_id=>current_user.id)
    

  end



  # GET /questions/1
  # GET /questions/1.json
  def show
    @questions= Question.all
    @question= Question.find(params[:id])
    @subjects = Subject.all
    @answers = @question.answers.paginate(:page => params[:page], :per_page =>10)
    @userdtl = Userdetail.all
    @likes = Like.all
    @dislikes = Dislike.all
    @newquestions =Question.last(5).reverse

    @cnt=Answer.where(:user_id =>current_user.id).count
    @unanswered=Question.all.count-@cnt
    
  end

  # GET /questions/new
  def new
    @userdtl = Userdetail.all
    @question = Question.new

    #@answer = Answer.new(question_id: params[:question_id])
  end

  # GET /questions/1/edit
  def edit
  end


  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user_id=current_user.id
    @userdtl = Userdetail.all


    require 'open3'
    cmd = 'gingerice "'+question_params[:userquestion]+'?"'
    stdin, @stdout, stderr, wait_thr = Open3.popen3(cmd) 
    @question.userquestion = @stdout.read



    respond_to do |format|
      if @question.save
        format.html { redirect_to questions_path, notice: @stdout.read }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:userquestion,:question_id, :user_id, :subject_id)
    end
end
