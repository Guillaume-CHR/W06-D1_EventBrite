json.extract! attendance, :id, :guest_id, :event_id, :stripe_customer_id, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
