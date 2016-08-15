class Contact
  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  @@contacts = []
  @@id = 0

  # This method should initialize the contact's attributes
  def initialize (first_name, last_name, email, note = "N/A")
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @id = @@id
    @@id += 1 # this way the next contact will get a different id
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create (first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attr1, attr2)
    send("#{attr1}=", attr2)
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(user_input)
    puts "searching using '#{user_input}'"
    case user_input
    when "first_name"
      puts "enter first name"
      first_name = gets.chomp
      Contact.find_first_name(first_name)
    when "last_name"
      puts "enter last name"
      last_name = gets.chomp
      Contact.find_last_name(last_name)
    when "e_mail"
      puts "enter e_mail"
      email = gets.chomp
      Contact.find_email(email)
    when "id"
      puts "enter ID number:"
      id_num = gets.chomp
      Contact.find_id(id_num)
    else
      puts "I don't know what's going on."
    end
  end

# This method return contact that has first_name
  def self.find_first_name(first_name)
    @@contacts.each do |x|
      if x.first_name == first_name
        x.output_contact_info
      end
    end
  end

# This method return contact that has last_name
  def self.find_last_name(last_name)
    @@contacts.each do |x|
      if x.last_name == last_name
        x.output_contact_info
      end
    end
  end

# This method return contact that has email
  def self.find_email(email)
    @@contacts.each do |x|
      if x.email == email
        x.output_contact_info
      end
    end
  end

# This method should accept an id as an argument
# and return the contact who has that id
  def self.find_id(id_num)
    @@contacts.each do |x|
      if x.id == id_num.to_i
        x.output_contact_info
        return x
      end
    end
  end

# This instance method ouputs all the contact info of that instance
  def output_contact_info
    puts "****************"
    puts "Id: " + id.to_s
    puts "First_name: " + first_name.to_s
    puts "Last_name: " + last_name.to_s
    puts "Email: " + email.to_s
    puts "Note: " + note.to_s
    puts "****************"
  end


  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name

  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end

Contact.create("Rui", "Dong", "Ruiemail", "awesome")
Contact.create("Julie", "He", "Julieemail", "awesome")
