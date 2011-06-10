class TrainingTypesController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index

  def show
    @type = find_instance
      @event = @type.training_events.apply_scopes(
                :search => [params[:search], :name, :date, :location],
                :order_by => parse_sort_param(:name, :date, :location))

    @training_type = TrainingType.find(params[:id])
  end

end
