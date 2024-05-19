module API
    module V1
        class JobsController < API::V1::APIController
            before_action :set_job, only: %i[show update destroy accept cancel complete]
            after_action :verify_authorized, only: %i[index show create update destroy]

            def index
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

            def accept
                @job.status = :accepted
                authorize @job
                if @job.save
                    render json: @job
                else
                    render json: @job.errors
                end
            end 

            def cancel
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
                @job.status = :active
                authorize @job
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
                params.require(:job).permit(:title, :description, :location, :amount, :job_type, :payment_type, :region, :deadline, :experience, :hours, :timeslot, :date, :status)
            end
        end
    end
  end