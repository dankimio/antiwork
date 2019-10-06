class JobsController < ApplicationController
  before_action :require_company!, except: %i[index]

  def index
    @jobs = [
      { title: 'UX designer', company: 'Frogogo', salary_min: 72000, salary_max: 105000, category: 'Software development', location: 'London' },
      { title: 'Creative manager', company: 'Facebook', salary_min: 42000, salary_max: 75000, category: 'Design', location: 'Berlin' },
      { title: 'Illustrator', company: 'WeWork', salary_min: 32000, salary_max: 55000, category: 'Customer support', location: 'Paris' },
      { title: 'Senior artwork designer', company: 'Airbnb', salary_min: 95000, salary_max: 125000, category: 'Software development', location: 'New York' },
      { title: 'Head of brand', company: 'Uber', salary_min: 75000, salary_max: 100000, category: 'Management', location: 'Sydney' },
    ]
  end

  def show
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
