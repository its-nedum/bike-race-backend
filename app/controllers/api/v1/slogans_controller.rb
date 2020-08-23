module Api
    module V1
        class SlogansController < ApplicationController
            def index
                slogans = Slogan.order('id ASC');
                render json: {
                    status: 'Success',
                    message: 'Loaded slogans',
                    data: slogans},
                    status: :ok
            end

            def show
                slogan = Slogan.find(params[:id])
                render json: {
                    status: 'Success',
                    message: 'Loaded slogan',
                    data: slogan},
                    status: :ok
            end

            def create
                slogan = Slogan.new(slogan_params)
                #check if the user with email address has submitted
                if Slogan.exists?(:email => slogan.email)
                    render json: {
                        status: 'Warning',
                        message: 'Record already exists',
                        data: slogan},
                        status: :ok
                else
                    if slogan.save
                        render json: {
                            status: 'Success',
                            message: 'Submission saved',
                            data: slogan},
                            status: :ok
                    else 
                        render json: {
                            status: 'Error',
                            message: 'Submission not saved',
                            data: slogan.errors},
                            status: :unprocessable_entity
                    end
                end
            end

            def destroy
                slogan = Slogan.find(params[:id])
                slogan.destroy
                render json: {
                    status: 'Success',
                    message: 'Slogan deleted',
                    data: slogan},
                    status: :ok
            end

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