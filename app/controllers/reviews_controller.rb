class ReviewsController < ApplicationController
    def index
        reviews = Review.where("book_id = ?", params[:book_id])
        render json: reviews.to_json(include: [:user], except: [:updated_at])
    end

    def create
        review = Review.new(set_params)
        set_title(review)
        review.save
        if review.valid?
            render json: review.to_json(include: [:user], except: [:created_at, :updated_at])
        else
            render json: { error: 'review is invalid' }, status: :not_acceptable
        end
    end

    def update
        review = Review.find(params[:id])
        review.update(set_params)
        set_title(review)
        review.save
        if review.valid?
            render json: review.to_json(include: [:user], except: [:created_at, :updated_at])
        else
            render json: { error: 'review is invalid' }, status: :not_acceptable
        end
    end

    def destroy
        review = Review.find(params[:id])
        review.destroy
    end

    private

    def set_params
        params.require(:review).permit(:title, :content, :rating, :user_id, :book_id)
    end

    def set_title(review)
        if review.title == ""
            review.title = review.content.truncate(25)
        end
    end
end
