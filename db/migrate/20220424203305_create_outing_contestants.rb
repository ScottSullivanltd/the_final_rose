class CreateOutingContestants < ActiveRecord::Migration[5.2]
  def change
    create_table :outing_contestants do |t|
      t.references :outing, foreign_key: true
      t.references :contestant, foreign_key: true

      t.timestamps
    end
  end
end
