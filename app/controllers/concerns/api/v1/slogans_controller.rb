module Api
    module V1
        class SlogansController < ApplicationController
            def index
                @slogans = Slogan.order('created_at DESC');
                render json: {
                    status: 'Success',
                    message: 'Loaded slogans',
                    data: slogans},
                    status: :ok
            end
        end
    end
end