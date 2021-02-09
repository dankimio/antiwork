# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

titles = [
  'UX designer', 'Creative manager', 'Illustrator',
  'Artwork designer', 'Head of brand', 'UI designer',
  'Product designer', 'Creative lead', 'Graphic designer',
  'Senior designer', 'Design intern', 'Mobile app designer'
]
companies = [
  'Twitter', 'Facebook', 'WeWork',
  'Airbnb', 'Uber', 'Google',
  'Dribbble', 'Adobe', 'Stripe'
]

companies.each do |company_name|
  company = Company.create!(
    email: "admin@#{company_name.downcase}.com",
    name: company_name
  )

  2.times do
    salary_min = (50..100).to_a.sample * 1000
    Job.create!(
      apply_url: 'https://google.com',
      category: Job.categories.keys.sample,
      company: company,
      description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis maiores praesentium unde accusamus. Delectus, esse quis, neque asperiores commodi placeat architecto veniam maiores ratione sed tempora tenetur dignissimos iusto voluptatibus?',
      how_to_apply: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis maiores praesentium unde accusamus. Delectus, esse quis, neque asperiores commodi placeat architecto veniam maiores ratione sed tempora tenetur dignissimos iusto voluptatibus?',
      level: Job.levels.keys.sample,
      remote: [false, true].sample,
      salary_max: salary_min * 2,
      salary_min: salary_min,
      title: titles.sample,
      visa_sponsorship: [false, true].sample
    )
  end
end
