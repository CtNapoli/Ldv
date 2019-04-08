class AddApartmentInEvidenceFlag < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :in_evidence, :boolean, default: false
  end
end
