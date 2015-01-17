require('sinatra')
require('sinatra/reloader')
require('./lib/contact')
require('./lib/phone')
also_reload('lib/**/*.rb')

get('/') do
  @all_contacts = Contact.all()
  erb(:index)
end

post('/directory') do
  name = params.fetch("name")
  phone_number_primary = params.fetch("phone_number_primary")
  contacts = Contact.new(name, phone_number_primary)
  contacts.save()
  @all_contacts = Contact.all()
  redirect '/'
end

post('/clear') do
  Contact.clear()
  redirect '/'
end

post('/delete') do
    Contact.delete_at_index(params.fetch('hidden_num').to_i)
  redirect '/'
end

post('/numbers') do
  new_number = params.fetch('new_number')
  @number = Phone.new(new_number)
  @number.save()
  @contact = Contact.find(params.fetch('contact_id').to_i())
  @contact.add_number(@number)
  erb(:contact_numbers)
end

get('/contact_numbers/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:contact_numbers)
end
