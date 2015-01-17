class Contact
  @@all_contacts = []
  attr_reader(:name, :phone_number_primary)

  define_method(:initialize) do |name, phone_number_primary|
    @name = name.downcase().split.map(&:capitalize).join(' ')
    @phone_number_primary = phone_number_primary
    @numbers = []
    @id = @@all_contacts.length().+(1)
  end

  define_method(:numbers) do
    @numbers
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@all_contacts
  end

  define_method(:save) do
    @@all_contacts.push(self)
  end


  define_singleton_method(:clear) do
    @@all_contacts = []
  end

  define_singleton_method(:all_numbers_contact) do |name|
    return_array = []
    @@all_contacts.each() do |contact|
      if name.downcase().split.map(&:capitalize).join(' ') == contact.name()
        return_array.push(contact.phone_number_primary())
      end
    end
    return_array.join(", ")
  end

    define_singleton_method(:find) do |id|
    found_contact = nil
    @@all_contacts.each() do |contact|
      if contact.id().eql?(id)
        found_contact = contact
      end
    end
    found_contact
  end

  define_singleton_method(:edit_primary) do |primary_number_original, primary_number_replace|
    @@all_contacts.each() do |contact|
      if primary_number_original == contact.phone_number_primary()
         contact.phone_number_primary().replace(primary_number_replace)
      end
    end
  end

  define_singleton_method(:delete_at_index) do |index|
    @@all_contacts.delete_at(index)
  end

  define_method(:add_number) do |number|
    @numbers.push(number)
  end
end
