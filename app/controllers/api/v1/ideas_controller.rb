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
    def update
        @idea = Idea.find(params[:id])
        @idea.update(idea_params)

        render json: @idea, status: 200
    end
    def destory
        @idea = Idea.find(params[:id])
        @idea.delete

        render json: {ideaId: @idea.id}
    end

    private 
    def idea_params
        params.require(:idea).permit(:title, :body)
    end
  end
end