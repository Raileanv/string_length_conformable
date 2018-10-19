RSpec.describe StringLengthConformable do
  it "has a version number" do
    expect(StringLengthConformable::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(ActiveRecord::Base).to respond_to acts_as_string_length_conformable
  end
end
