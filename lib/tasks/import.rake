namespace :import do
  desc "import jobs from workable"
  task jobs: :environment do
    logger = ActiveSupport::TaggedLogging.new(Rails.logger)
    client = Workable::Client.new(api_key: ENV['WORKABLE_API_KEY'], subdomain: ENV['WORKABLE_SUBDOMAIN'])
    workable_jobs = client.jobs
    loop do
      workable_jobs.each do |workable_job|
        job = Job.where(workable_id: workable_job["id"]).first_or_initialize
        job_attributes = workable_job.slice("full_title", "shortcode", "code", "state", "department", "url",
                                                 "application_url", "shortlink")
        job_attributes["workable_created_at"] = workable_job["created_at"]
        job_attributes["job_location_attributes"] = workable_job["location"]
        job.assign_attributes(job_attributes)
        logger.tagged("Job import") do
          if job.save
            logger.info "#{ job.full_title } saved successfully"
          else
            logger.info "#{ job.full_title } failed to save - #{ job.errors.full_messages.join(",") }"
          end
        end
      end
      break unless workable_jobs.next_page?
      workable_jobs = workable_jobs.fetch_next_page
    end
  end

  desc "import stages from workable"
  task stages: :environment do
    logger = ActiveSupport::TaggedLogging.new(Rails.logger)
    client = Workable::Client.new(api_key: ENV['WORKABLE_API_KEY'], subdomain: ENV['WORKABLE_SUBDOMAIN'])
    client.stages.each do |stage|
      WorkableStage.find_or_create_by(stage) # workable gem returns a hash
    end
  end
end
