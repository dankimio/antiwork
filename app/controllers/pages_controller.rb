class PagesController < ApplicationController
  def index
    @jobs = [
      { title: 'Ruby on Rails developer', company: 'Frogogo', salary: '$72k–105k', category: 'Software development', location: 'London' },
      { title: 'Product designer', company: 'Facebook', salary: '$42k–75k', category: 'Design', location: 'Berlin' },
      { title: 'Customer support agent', company: 'WeWork', salary: '$32k–555k', category: 'Customer support', location: 'Paris' },
      { title: 'Android developer', company: 'Airbnb', salary: '$95k–125k', category: 'Software development', location: 'New York' },
      { title: 'Project manager', company: 'Uber', salary: '$75k–100k', category: 'Management', location: 'Sydney' },
    ]
  end

  def new
  end
end
