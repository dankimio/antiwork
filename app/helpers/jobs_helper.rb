module JobsHelper
  JOB_PAGE_ALLOWED_MARKDOWN_TAGS = %w[a em h2 h3 h4 h5 h6 li p strong ul].freeze
  STRUCTURED_DATA_ALLOWED_MARKDOWN_TAGS = %w[p ul li].freeze

  def published_at_count(job)
    return 0 if job.published_at.to_date >= Date.current

    (job.published_at.to_date..Date.current).count - 1
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

  def job_meta_description(job)
    markdown(job.description, sanitize_tags: []).squish
  end

  def job_page_markdown(text = '')
    markdown(text, sanitize_tags: JOB_PAGE_ALLOWED_MARKDOWN_TAGS)
  end
end
