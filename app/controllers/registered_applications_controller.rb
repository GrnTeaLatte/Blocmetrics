class RegisteredApplicationsController < ApplicationController


  def index
    @registered_applications = RegisteredApplication.visible_to(current_user)
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new(post_params)
    @registered_application.user = current_user

    if @registered_application.save
      flash[:notice] = "Post was saved successfully"
      redirect_to @registered_application
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the application."
      render :show
    end
  end

  private

  def post_params
    params.require(:registered_application).permit(:name, :url)
  end

end
