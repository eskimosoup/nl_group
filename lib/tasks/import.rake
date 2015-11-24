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
      begin
        WorkableStage.find_or_create_by!(stage) # workable gem returns a hash
      rescue ActiveRecord::RecordInvalid => invalid
        logger.tagged("Stage import") do
          logger.info "#{ stage["name"] } failed to save - #{ invalid.record.errors.errors.full_messages.join(",") }"
        end
      end
    end
  end

  desc "import candidates for each job"
  task candidates: :environment do
    logger = ActiveSupport::TaggedLogging.new(Rails.logger)
    client = Workable::Client.new(api_key: ENV['WORKABLE_API_KEY'], subdomain: ENV['WORKABLE_SUBDOMAIN'])
    stage_names = WorkableStage.pull_candidates.pluck(:name)
    jobs = Job.published
    jobs.each do |job|
      candidates = client.job_candidates(job.shortcode)
      loop do
        candidates.each do |workable_candidate|
          next unless stage_names.include?(workable_candidate["stage"])
          member_profile = MemberProfile.find_or_initialize_by(email: workable_candidate["email"])
          member_profile.first_name = workable_candidate["firstname"]
          member_profile.last_name = workable_candidate["lastname"]
          member_profile.full_name = workable_candidate["name"]

          logger.tagged("Candidate import") do
            if member_profile.save
              logger.info "#{ member_profile.full_name } saved successfully"
              begin
                member_profile.jobs << job
              rescue ActiveRecord::RecordNotUnique => e
              end
            else
              logger.info "#{ member_profile.full_name } failed to save - #{ member_profile.errors.full_messages.join(",") }"
            end
          end
        end
        break unless candidates.next_page?
        candidates = candidates.fetch_next_page
      end
    end
  end

  desc "import all - jobs, stages and candidates"
  task all: [:jobs, :stages, :candidates]
end
