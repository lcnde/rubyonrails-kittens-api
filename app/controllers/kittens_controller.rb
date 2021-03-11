class KittensController < ApplicationController

  def index
    @kitten = Kitten.all
  end
  
  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to @kitten, notice: 'Kitten created successfully.'
    else
      redirect_to new_kitten_path, alert: 'Kitten creation failed.'
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: 'Kitten updated successfully.'
    else
      redirect_to edit_kitten_path, alert: 'Kitten update failed.'
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    redirect_to root_path, notice: "Kitten deleted, how could you do that ;("
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
