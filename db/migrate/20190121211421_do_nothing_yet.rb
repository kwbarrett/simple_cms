class DoNothingYet < ActiveRecord::Migration[5.1]

  def up
  end

  def down
  end

  # Using the change() method, Rails allows us to only write the up() method. It will automatically figure out the down()
  # Example, if up() is create table, Rails knows that down() is the opposite.
  #
  # def change
  # end

end
