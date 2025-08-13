class CreateSubscriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :plan
      t.string :status
      t.string :stripe_customer_id
      t.string :stripe_subscription_id
      t.datetime :current_period_end

      t.timestamps
    end
  end
end
