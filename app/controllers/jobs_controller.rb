class JobsController < ApplicationController
  before_action :require_company!

  def index
    @jobs = [
      { title: 'UX designer', company: 'Frogogo', salary: '$72k–105k', category: 'Software development', location: 'London' },
      { title: 'Creative manager', company: 'Facebook', salary: '$42k–75k', category: 'Design', location: 'Berlin' },
      { title: 'Illustrator', company: 'WeWork', salary: '$32k–555k', category: 'Customer support', location: 'Paris' },
      { title: 'Senior artwork designer', company: 'Airbnb', salary: '$95k–125k', category: 'Software development', location: 'New York' },
      { title: 'Head of brand', company: 'Uber', salary: '$75k–100k', category: 'Management', location: 'Sydney' },
    ]
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
