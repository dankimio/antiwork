class JobsController < ApplicationController
  before_action :require_company!

  def new
    @job = current_company.jobs.build
  end

  def create
    @job = current_company.jobs.build(job_params)

    if @job.save
      redirect_to company_info_url
    else
      render :new
    end
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
