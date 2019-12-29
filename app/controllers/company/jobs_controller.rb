class Company::JobsController < ApplicationController
  def index
    @jobs = current_company.jobs.includes(:company).order(created_at: :desc)
  end
end
