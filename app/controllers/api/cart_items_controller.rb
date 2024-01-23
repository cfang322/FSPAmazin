class API::CartItemsController < ApplicationController
    wrap_parameters include: CartItem.attribute_names + ['quantity', 'userId', 'productId']

    def index 
        @cart_items = current_user.cart_items 
        render :index
    end 

    def create
        @cart_item = CartItem.new(cart_item_params)
        if @cart_item.save
            render :show
        else
            render json: { errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
        end
    end

    
    def destroy
        @cart_item = CartItem.find_by(id: params[:id])
        if @cart_item
            @cart_item.destroy
            head :no_content
        else
            head :not_found
        end
    end 

    def update
        @cart_item = CartItem.find_by(id: params[:id])
        if @cart_item
            if @cart_item.update(cart_item_params)
                render :show
            else
                render json: { errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
            end
        else
            head :not_found
        end
    end

    def cart_item_params 
        params.require(:cart_item).permit(:id, :quantity, :user_id, :product_id)
    end
end
