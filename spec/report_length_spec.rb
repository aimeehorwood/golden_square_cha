require "report_length"
RSpec.describe "report length method" do
  it "returns a given strings length" do
    result = report_length("")
    expect(result).to eq "This string was 0 characters long."
  end
  it "returns a given strings length" do
    result = report_length("Aimee")
    expect(result).to eq "This string was 5 characters long."
  end
  it "returns a given strign length including white space" do
    result = report_length("Hello World")
    expect(result).to eq "This string was 11 characters long."
  end
  it "returns a given strign length including special characters and white space" do
    result = report_length("h£ll*   W@rlD")
    expect(result).to eq "This string was 13 characters long."
  end
end
