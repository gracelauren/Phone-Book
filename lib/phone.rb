class Phone
  @@all_numbers = []
  attr_reader(:type, :new_number)

  define_method(:initialize) do |type, new_number|
    @type = type
    @new_number = new_number
  end

  define_singleton_method(:all) do
    @@all_numbers
  end

  define_method(:save) do
    @@all_numbers.push(self)
  end

  define_singleton_method(:clear) do
    @@all_numbers = []
  end
end
