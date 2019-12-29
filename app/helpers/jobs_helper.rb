module JobsHelper
  def posted_at_count(job)
    return 0 if job.created_at.to_date >= Date.current

    (job.created_at.to_date..Date.current).count
  end

  def salary_range(job)
    # $50 000
    return number_to_currency(job.salary_min) if job.salary_min == job.salary_max
    # From $50 000
    if job.salary_max.blank?
      return t('helpers.jobs.salary_range.from', value: number_to_currency(job.salary_min))
    end

    # $50 000–$100 000
    "#{number_to_currency job.salary_min} – #{number_to_currency job.salary_max}"
  end

  def job_meta_description(job, limit: 150)
    raw_markdown(job.description).truncate(limit).squish
  end
end
