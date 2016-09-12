class CreateJoinTableAudiencesTestimonials < ActiveRecord::Migration
  def change
    create_join_table :audiences, :testimonials do |t|
      t.index [:audience_id, :testimonial_id]
      t.index [:testimonial_id, :audience_id]
    end
  end
end
