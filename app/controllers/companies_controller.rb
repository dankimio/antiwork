class CompaniesController < ApplicationController
  before_action :require_company!
  before_action :set_company

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  private

  def set_company
    @company = current_company
  end

  def company_params
    params
      .require(:company)
      .permit(:name, :website, :logo)
  end
end
