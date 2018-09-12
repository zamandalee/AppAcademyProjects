class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end
  
  def show
    @cat = Cat.find_by(id: params[:id])
    
    if @cat 
      render :show
    else 
      redirect_to cats_url
    end
  end
  
  def new #DOESN'T PERSIST, it's a GET request
    @cat = Cat.new
    render :new
  end
  
  def create
    @cat = Cat.new(cat_params)
    
    if @cat.save
      redirect_to cat_url(@cat) #redirect to show
    else
      redirect_to new_cat_url #redirect to new   
    end
  end
  #edit is to update as new is to create
  def edit #DOESN'T PERSIST CHANGES, GET request
    @cat = Cat.find_by(id: params[:id])
    
    if @cat
      render :edit 
    else 
      redirect_to cats_url
    end
  end
  
  def update
    @cat = Cat.find_by(id: params[:id])
    
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat) #show
    else
      render :edit
    end
  end
  
  private
  def cat_params
    params.require(:cat).permit(:name, :birthday, :sex, :color, :description)
  end
end