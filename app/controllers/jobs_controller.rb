class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  def index
    @jobs = Job.most_recent.all
  end

  # GET /jobs/1
  def show
  end

  def premium
    @jobs = Job.where(premium: true).most_recent.paginate(page: params[:page], per_page: 2)

  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      redirect_to @job, notice: 'Job was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
    redirect_to jobs_url, notice: 'Job was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      id = params[:id]
      @job = Job.find(id)
    end

    # Only allow a trusted parameter "white list" through.
    def job_params
      params.require(:job).permit :title, :description, :premium
    end
end
