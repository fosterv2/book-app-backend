class ReviewsController < ApplicationController
    def index
        reviews = Review.where("book_id = ?", params[:book_id])
        render json: reviews.to_json(include: [:user], except: [:updated_at])
    end

    def create
        review = Review.create(set_params)
        render json: review.to_json(except: [:created_at, :updated_at])
    end

    def update
        review = Review.find(params[:id])
        review.update(set_params)
        render json: review.to_json(except: [:created_at, :updated_at])
    end

    def destroy
        review = Review.find(params[:id])
        review.destroy
    end

    private

    def set_params
        params.require(:review).permit(:title, :content, :rating, :user_id, :book_id)
    end
end
