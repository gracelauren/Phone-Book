require("rspec")
require("contact")
require("phone")


describe(Contact) do
  before() do
    Contact.clear()
  end


  describe("#name") do
    it("returns the name of the contact") do
      test_contact = Contact.new("Grace", "999-999-9999")
      expect(test_contact.name()).to(eq("Grace"))
    end
  end

  describe("#numbers") do
    it("returns the numbers of the contact in an array") do
      test_contact = Contact.new("Grace", "999-999-9999")
      expect(test_contact.numbers()).to(eq(["999-999-9999"]))
    end
  end

  describe('#phone_number_primary') do
    it("returns the phone_number_primary of the contact") do
      test_contact = Contact.new("Grace", "999-999-9999")
      expect(test_contact.phone_number_primary()).to(eq("999-999-9999"))
    end
  end

  describe('#id') do
    it("returns the id of the the contact entered into all_contacts array") do
      test_contact = Contact.new("Grace", "999-999-9999")
      expect(test_contact.id()).to(eq(1))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a contact to the user's Phone Book") do
    test_contact = Contact.new("Grace", "999-999-9999")
    test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe(".clear") do
    it("will clear out the 'all_contacts' array") do
      test_contact = Contact.new("Grace", "999-999-9999").save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe(".all_numbers_contact") do
    it("Searches contacts by name and returns all the phone numbers present with that name") do
    test_contact = Contact.new("Grace", "999-999-9999")
    test_contact.save()
    test_contact2 = Contact.new("Grace", "222-444-9999")
    test_contact2.save()
      expect(Contact.all_numbers_contact("Grace")).to(eq("999-999-9999, 222-444-9999"))
    end
  end

  describe(".find") do
    it("returns a contact by its id number") do
      test_contact = Contact.new("Grace", "999-999-9999")
      test_contact.save()
      test_contact2 = Contact.new("Grace", "222-444-9999")
      test_contact2.save()
      expect(Contact.find(test_contact.id())).to(eq(test_contact))
    end
  end

  describe(".edit_primary") do
    it("will replace the primary phone number") do
      test_contact = Contact.new("Grace", "999-999-9999")
      test_contact.save()
      Contact.edit_primary("999-999-9999", "555-555-5555")
      expect(test_contact.phone_number_primary()).to(eq("555-555-5555"))
    end
  end

  describe(".delete_at_index") do
    it("will delete one contact") do
      test_contact = Contact.new("Grace", "999-999-9999")
      test_contact.save()
      test_contact1 = Contact.new("Isabel", "333-444-5555")
      test_contact1.save()
      Contact.delete_at_index(1)
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

    describe('#add_number') do
    it("adds a new number to a contact") do
      test_contact = Contact.new("Grace", "999-999-9999")
      test_phone = Phone.new("444-444-4444")
      test_contact.add_number(test_phone)
      expect(test_contact.numbers()).to(eq([test_phone]))
    end
  end
end
