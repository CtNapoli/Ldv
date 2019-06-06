class RemoveApartmentInEvidenceFlag < ActiveRecord::Migration[5.2]
  def change
    remove_column :apartments, :in_evidence
  end
end
