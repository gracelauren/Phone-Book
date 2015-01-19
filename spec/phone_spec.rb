require("rspec")
require("phone")

describe(Phone) do
  before() do
    Phone.clear()
  end
  
    describe("#type") do
    it("returns the type of the new number of the phone") do
      test_phone = Phone.new("cell", 555-555-5555")
      expect(test_phone.new_number()).to(eq("cell"))
    end
  end

  describe("#new_number") do
    it("returns the new number of the phone") do
      test_phone = Phone.new("cell", 555-555-5555")
      expect(test_phone.new_number()).to(eq("555-555-5555"))
    end
  end


  describe(".all") do
    it("is empty at first") do
      expect(Phone.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a new_number to the array of saved new_numbers") do
    test_phone = Phone.new("cell", "555-555-5555")
    test_phone.save()
      expect(Phone.all()).to(eq([test_phone]))
    end
  end

  describe(".clear") do
    it("empty out all of the saved phones") do
      test_phone = Phone.new("cell", "555-555-5555").save()
      Phone.clear()
      expect(Phone.all()).to(eq([]))
    end
  end
end
