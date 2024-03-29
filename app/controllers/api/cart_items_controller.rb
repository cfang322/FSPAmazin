class Api::CartItemsController < ApplicationController
    wrap_parameters include: CartItem.attribute_names + ['quantity', 'userId', 'productId']
    before_action :require_logged_in, only: [:index]
    
    def index 
        # if current_user
            @cart_items = current_user.cart_items
            
            # if @cart_items.present?
            #     render :index
            # else
            #     render json: { cart_items: [] }
            # end
            
        # else
        #     render json: { error: 'User Not Found' }, status: :unprocessable_entity
        # end
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