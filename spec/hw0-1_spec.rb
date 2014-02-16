require './lib/hw0-1.rb'
describe "sum_elements_of_array_of_integers" do
  it "returns_0_for_empty_array" do
    sum([]).should eq(0)
  end
  it "returns_6_for_1_2_3" do
    sum([1,2,3]).should eq(6)
  end
end
describe "sum_2_largest_elements_of_array_of_integers" do
  it "returns_0_for_empty_array" do
    max_2_sum([]).should eq(0)
  end
  it "returns_5_for_1_2_3" do
    max_2_sum([1,2,3]).should eq(5)
  end
  it "returns_111_for_5_6_12_0_8_99_4" do
    max_2_sum([5,6,12,0,8,99,4]).should eq(111)
  end
end
describe "sum_2_n?_for_array_of_integers" do
  it "returns_false_for_empty_array" do
    sum_to_n?([],8).should eq(false)
  end
  it "returns_true_for_5_6_summing_to_11" do
    sum_to_n?([5,6],11).should eq(true)
  end
  it "returns_true_for_3_5_55_22_6_6_12_summing_to_11" do
    sum_to_n?([3,5,55,22,6,6,12],11).should eq(true)
  end
end
