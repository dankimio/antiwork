module JobsHelper
  def posted_at_count(job)
    return 0 if job.created_at.to_date >= Date.current

    (job.created_at.to_date..Date.current).count
  end
end
