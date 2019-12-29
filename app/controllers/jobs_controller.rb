class JobsController < ApplicationController
  before_action :require_company!, except: %i[index show]

  def index
    @jobs = Job.includes(:company).order(created_at: :desc)
    @jobs = @jobs.where(category: params[:category]) if params[:category].present?
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = current_company.jobs.build
  end

  def create
    @job = current_company.jobs.build(job_params)

    if @job.save
      redirect_to edit_company_url
    else
      render :new
    end
  end

  def edit
    @job = current_company.jobs.find(params[:id])
  end

  private

  def job_params
    params
      .require(:job)
      .permit(
        :title, :category, :salary_min, :salary_max, :remote, :visa_sponsorship,
        :city, :country, :level, :description, :how_to_apply
      )
  end
end
