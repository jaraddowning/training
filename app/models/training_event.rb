class TrainingEvent < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name       :string, :required
    date       :date
    location   :string, :required
    timestamps
  end

  belongs_to :training_type

  has_many :user_trainings, :dependent => :destroy
  has_many :attendees, :through => :user_trainings, :source => :user, :accessible => true
  has_many :training_facilitators
  has_many :facilitators, :through => :training_facilitators, :source => :user, :accessible => true

  children :attendees, :facilitators

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
