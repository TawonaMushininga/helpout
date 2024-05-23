module API
    module V1
        class JobApplicationsController < API::V1::APIController

            before_action :set_job_application, only: %i[show update destroy accept]
            after_action :verify_authorized, only: %i[show create update destroy accept]

            def index
                if current_user.employer?
                    @job_appications =  current_user.jobs.job_applications
                else
                    render json: @job_applications
                end
            end

            def show
                render json: @job_application
            end

            def accept
                authorize @job_application
                @job_application.job.status = :accepted
                @job_application.job.employee_id = @job_application.user_id
                if @job_application.job.save!
                    @job_application.accepted!
                    render json: @job_application
                else
                    render json: @job_application.errors
                end
            end

            def reject
                authorize @job_application
                @job_application.rejected!
                render json: @job_application
            end

            def create
                @job_application = JobApplication.new(job_application_params)
                authorize @job_application
                @job_application.user_id = current_user.id

                if @job_application.save
                    render json: @job_application
                else
                    render json: @job_application.errors
                end
            end

            def update
                authorize @job_application
                if @job_application.update(job_application_params)
                    render json: @job_application
                else
                    render json: @job_application.errors
                end
            end

            def destroy
                authorize @job_application
                @job_application.destroy
                render json: {message: "Job Application Deleted"}
            end

            private

            def job_application_params
                params.require(:job_application).permit(:job_id, :user_id, :status)
            end

            def set_job_application
                @job_application = Job.find(params[:job_id])
            end
        end
    end

end
