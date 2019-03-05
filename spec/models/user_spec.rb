require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:birth_day) }
  it { should validate_presence_of(:gender) }
  it { should have_db_column(:encrypted_password) }

  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }

end
