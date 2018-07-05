module Api::V1
  class IdeasController < ApplicationController
    def index
      @ideas = Idea.all

      render json: @ideas, status: 200
    end

    def show
        @idea = Idea.find(params[:id])

        render json: @idea, status: 200
    end
    def create
        @idea = Idea.create(idea_params)

        render json: @idea, status: 200
    end
    def edit 
      @idea = Idea.find(params[:id])
    end
    def update
        @idea = Idea.find(params[:id])
        @idea.update_attributes(idea_params)

        render json: @ideas, status: 200
    end
    def destroy #  work
        @idea = Idea.find(params[:id])
        @idea.destroy
        # raise params.inspect
        render json: @ideas, status: 200
        # redirect_to api_v1_ideas_path(@idea, format: :json)

    end
    # def destory
    #     @idea = Idea.find(params[:id])
    #     @idea.destroy

    #     render json: {ideaId: @idea.id}
    #     # redirect_to json: @ideas, status: 200
    # end

    private 
    def idea_params
        params.permit(:title, :body, :likes)
    end
  end
end