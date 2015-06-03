require "./merge.rb"

describe "#merge" do

  it "merges two sorted arrays" do
    arr1 = [1,3,5]
    arr2 = [2,4,6]
    expect(merge(arr1, arr2)).to eq [1,2,3,4,5,6]
  end

  it "handles arrays of different length" do
    arr1 = [1,3]
    arr2 = [2,4,5,6]
    expect(merge(arr1, arr2)).to eq [1,2,3,4,5,6]
  end

  it "handles arrays with duplicate values" do
    arr1 = [1,2,3]
    arr2 = [3,4,5]
    expect(merge(arr1, arr2)).to eq [1,2,3,3,4,5]
  end

  it "handles an empty array" do
    arr1 = []
    arr2 = [1,2,3]
    expect(merge(arr1, arr2)).to eq [1,2,3]
  end

  it "returns nil if anything but a Fixnum is present in the array" do
    arr1 = ["1","2","3"]
    arr2 = [4,5,6]
    expect(merge(arr1, arr2)).to eq nil
    arr1 = [{},{},{}]
    arr2 = [4,5,6]
    expect(merge(arr1, arr2)).to eq nil
    arr1 = [1.1,1.2,1.3]
    arr2 = [4,5,6]
    expect(merge(arr1, arr2)).to eq nil
  end
end