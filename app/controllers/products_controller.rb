class ProductsController < ApplicationController
   before_action :set_product, only:[:show, :edit, :update]
   
   def index
        @products = Product.all
        
        respond_to do |format|
            format.html  # index.html.erb
            format.json  { render :json => @products.to_json }
        end
   end
   
   def show
   end
    
   def new
       @product = Product.new
   end 
   
   def create
       @product = Product.new(product_params)
       if @product.save
          flash[:success] = "Product wast created successfully"
          redirect_to product_path(@product)
       else
          render 'edit'
       end
   end
   
   def edit
   end
   
    def update
        if @product.update(product_params)
            flash[:success] = "Recipe was updated successfully!"
            redirect_to product_path(@product)
        else
            render 'edit'
        end
    end
    
    def destroy
       set_product.destroy
       flash[:success] = "Product deleted successfully"
       redirect_to products_path
    end
    
    private
        def set_product
           @product = Product.find(params[:id]) 
        end
        
        def product_params
           params.require(:product).permit(:proname, :description) 
        end

end