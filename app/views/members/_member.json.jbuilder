json.extract! member, :id, :firstName, :lastName, :email, :phoneNumber, :paymentDay, :active, :nextPaymentDate, :created_at, :updated_at
json.url member_url(member, format: :json)
