class TrainingType < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name    :string, :name => true
    about   :text
    timestamps
  end

  belongs_to :req_class
  has_many :training_events

  children :training_events

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
