class PortfoliosController < ApplicationController
  layout "portfolio"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    
    params[:order].each do |key, value|
      sorts = Portfolio.find(value[:id])
      if sorts.update(position: value[:position])  
      else
        puts sorts.errors.full_messages
      end
    end
    
    render nothing: true
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolios_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio criado com sucesso.' }
        format.json { render :show, status: :created, location: portfolios_path }
      else
        format.html { render :new }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    
    respond_to do |format|
      if @portfolio_item.update(portfolios_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio atualizado com sucesso!!!.' }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end
  
  def destroy 
    # Perfom the lookup
    @portfolio_item = Portfolio.find(params[:id])

    # Destroy/delete the record
    @portfolio_item.destroy
    
    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
  def portfolios_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:id, :name, :_destroy])
  end
end
