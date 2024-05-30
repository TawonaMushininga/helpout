module API
    module V1
        class JobsController < API::V1::APIController
            before_action :set_job, only: %i[show update destroy accept cancel complete apply publish unpublish decline]
            after_action :verify_authorized, only: %i[show create update destroy accept cancel complete decline]

            def index
                if current_user.employer?
                    @jobs = current_user.jobs_mine
                elsif current_user.employee?
                    applied_job_ids = current_user.job_applications.pluck(:job_id)
                    @jobs = Job.where(status: :active)
                                .where.not(employer_id: [current_user.id, nil])
                                .where.not(id: applied_job_ids)
                else
                    @jobs = Job.where(status: :active)
                end
                render json: @jobs
            end

            def jobs_mine
                @jobs = current_user.jobs_mine
                authorize @jobs
                render json: @jobs
            end


            def show
                authorize @job
                render json: @job
            end

            def create
                @job = Job.new(job_params)
                @job.employer_id = current_user.id
                authorize @job
                if @job.save
                    render json: @job
                else
                    render json: @job.errors
                end
            end

            def publish
                @job.status = :active
                authorize @job
                if @job.save
                    render json: @job
                else
                    render json: @job.errors
                end
            end

            def unpublish
                @job.status = :inactive
                authorize @job
                if @job.save
                    render json: @job
                else
                    render json: @job.errors
                end
            end

            def cancel
                #endpoint for employer to cancel job
                @job.status = :cancelled
                authorize @job
                if @job.save
                    render json: @job
                else
                    render json: @job.errors
                end
            end

            def complete
                @job.status = :completed
                authorize @job
                if @job.save
                    render json: @job
                else
                    render json: @job.errors
                end
            end

            def decline
                #used by employees to decline job
                authorize @job
                @job.status = :active
                @job.employee_id = nil
                if @job.save
                    render json: @job
                else
                    render json: @job.errors
                end
            end

            def update
                authorize @job
                if @job.update(job_params)
                    render json: @job
                else
                    render json: @job.errors
                end
            end

            def destroy
                authorize @job
                @job.destroy
                render json: { message: 'Job deleted' }
            end

            def set_job
                begin
                    @job = Job.find(params[:id].to_i)
                rescue StandardError => e

                end
            end

            def job_params
                params.require(:job).permit(:title, :description, :location, :amount, :job_type, :payment_type, :region, :deadline, :experience, :hours, :timeslot, :date, :status, :employee_id, :max_applicants, :expires_at)
            end
        end
    end
  end