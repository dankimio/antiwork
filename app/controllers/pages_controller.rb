class PagesController < ApplicationController
  def index
    @jobs = [
      { title: 'UX designer', company: 'Frogogo', salary: '$72k–105k', category: 'Software development', location: 'London' },
      { title: 'Creative manager', company: 'Facebook', salary: '$42k–75k', category: 'Design', location: 'Berlin' },
      { title: 'Illustrator', company: 'WeWork', salary: '$32k–555k', category: 'Customer support', location: 'Paris' },
      { title: 'Senior artwork designer', company: 'Airbnb', salary: '$95k–125k', category: 'Software development', location: 'New York' },
      { title: 'Head of brand', company: 'Uber', salary: '$75k–100k', category: 'Management', location: 'Sydney' },
    ]
  end

  def show
  end

  def company_info
  end

  def payment
  end
end
