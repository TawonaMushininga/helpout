module API
    module V1
        class JobApplicationsController < API::V1::APIController

            before_action :set_job_application, only: %i[show update destroy accept reject]
            after_action :verify_authorized, only: %i[show create update destroy accept reject]

            def index
                if current_user.employer?
                    @job_applications =  JobApplication.where(job_id: params[:job_id]).preload(:job)
                    render json: @job_applications.to_json(include: :job)
                elsif current_user.employee?
                    @job_applications = current_user.job_applications.preload(:job)
                    render json: @job_applications.to_json(include: :job)
                else
                    @job_applications = JobApplication.all.preload(:job)
                    render json: @job_applications.to_json(include: :job)
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
                params.require(:job_application).permit(:job_id, :user_id, :status, :id)
            end

            def set_job_application
                @job_application = JobApplication.find(params[:id])
            end
        end
    end

end
