class Phone
  @@all_numbers = []
  attr_reader(:new_number)

  define_method(:initialize) do |new_number|
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
