class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update complete destroy ]

  # GET /tasks or /tasks.json
  def index
    @completed = Task.where(completed: true).count
    @todo      = Task.where(completed: false).count
    
    @tasks = Task.order(created_at: :desc)
    if params[:status] == "completed"
      @tasks = @tasks.where(completed: true)
    elsif params[:status] == "all"
      @tasks
    else
      @tasks = @tasks.where(completed: false)
    end
    @tasks = @tasks.page params[:page]
    
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice:  "Task <strong>#{@task.title.titleize}</strong> was created", flash: { html_safe: true } }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_path, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def complete
    @task.update(completed: "true")
    redirect_to root_path, notice: "Task <strong>#{@task.title.titleize}</strong> was marked as completed", flash: { html_safe: true }
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to tasks_path, status: :see_other, notice: "Task <strong>#{@task.title.titleize}</strong> was deleted", flash: { html_safe: true }}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.expect(task: [ :title, :description, :completed ])
    end
end
