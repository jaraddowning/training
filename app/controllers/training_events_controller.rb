class TrainingEventsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def index
    hobo_index TrainingEvent.apply_scopes(
                  :search => [params[:search], :name],
                  :order_by => parse_sort_param(:name, :date, :location))

  end

  def show
    @event = find_instance
      @student = @event.attendees.apply_scopes(
                :search => [params[:search], :name, :last_name],
                :order_by => parse_sort_param(:name, :last_name, :email_address, :trainer))

    @training_event = TrainingEvent.find(params[:id])
  end

end
