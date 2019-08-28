class JobsController < ApplicationController
  before_action :require_company!

  def new
  end
end
