class CreateSupportEmails < ActiveRecord::Migration
  def change
    create_table :support_emails do |t|
      t.string :have_questions
      t.string :call_to_order
      t.string :book_review

      t.timestamps null: false
    end
  end
end
