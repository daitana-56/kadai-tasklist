class TasksController < ApplicationController
  before_action :task_set, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in
  
  def index
    @tasks = current_user.tasks.order(id: :desc).page(params[:page]).per(20)
  end
  
  def show
  end
  
  def new
    @task = current_user.tasks.build
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = "タスクは正常に登録されました。"
      redirect_to @task
    else
      flash.now[:danger] = "タスクは登録されませんでした。"
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = "タスクは正常に更新されました。"
      redirect_to @task
    else
      flash.now[:danger] = "タスクの更新はできませんでした。"
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    flash[:success] = "タスクは削除されました。"
    redirect_to tasks_url
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def task_set
    @task = current_user.tasks.find(params[:id])
  end
end
