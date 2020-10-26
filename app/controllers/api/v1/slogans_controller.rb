module Api
    module V1
        class SlogansController < ApplicationController
            
            # This method create a user slogan entry and also prevent multiple submission
            # by checking the user's email with those in the database
            def create
                slogan = Slogan.new(slogan_params)
                #check if the user with email address has submitted
                if Slogan.exists?(:email => slogan.email)
                    render json: {
                        status: 'Warning',
                        message: 'Record already exists',
                        data: slogan,
                        code: 208
                    }
                else
                    if slogan.save
                        render json: {
                            status: 'Success',
                            message: 'Submission saved',
                            data: slogan,
                            code: 201,
                        }
                    else 
                        render json: {
                            status: 'Error',
                            message: 'Submission not saved',
                            data: slogan.errors,
                            code: 422,
                        }
                    end
                end
            end

            # This method returns all the submitted slogans
            def index
                slogans = Slogan.order('id ASC');
                render json: {
                    status: 'Success',
                    message: 'Loaded slogans',
                    data: slogans,
                    code: 200,
                }
            end



            # NOTE: The following methods below are extra CRUD endpoints I created for practice
            # they are not implemented

            # This method returns a single slogan
            def show
                slogan = Slogan.find(params[:id])
                render json: {
                    status: 'Success',
                    message: 'Loaded slogan',
                    data: slogan},
                    status: :ok
            end

            # This method deletes a user slogan submission
            def destroy
                slogan = Slogan.find(params[:id])
                slogan.destroy
                render json: {
                    status: 'Success',
                    message: 'Slogan deleted',
                    data: slogan},
                    status: :ok
            end

            # This method allow for updating a submitted slogan
            def update
                slogan = Slogan.find(params[:id])
                if slogan.update_attributes(slogan_params)
                    render json: {
                        status: 'Success',
                        message: 'Slogan updated',
                        data: slogan},
                        status: :ok
                else 
                    render json: {
                        status: 'Success',
                        message: 'Slogan not updated',
                        data: slogan},
                        status: :unprocessable_entity
                end
            end

            private def slogan_params
                params.permit(:firstname, :lastname, :email, :slogan)
            end
        end
    end
end