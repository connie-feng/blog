class CreateTestimonials < ActiveRecord::Migration[7.1]
  def change
    create_table :testimonials do |t|
      t.string :name
      t.string :city
      t.text :content
      t.datetime :published_at

      t.timestamps
    end
  end
end
