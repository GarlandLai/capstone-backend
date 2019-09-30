class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.column(:prompt1, :string)
      t.column(:prompt2, :string)
      t.column(:prompt3, :string)
      t.column(:content, :text)
      t.timestamps()
    end
  end
end