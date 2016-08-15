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

  # This method should return all of the existing contacts
  def self.all
    @@contacts.each do |x|
      puts "****************"
      puts "Id: " + x.id.to_s
      puts "First_name: " + x.first_name.to_s
      puts "Last_name: " + x.last_name.to_s
      puts "Email: " + x.email.to_s
      puts "Note: " + x.note.to_s
      puts "****************"
      puts ''
    end
  end


  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by
    puts "Enter what you like to search by: "
    puts "ex: first_name, last_name, e_mail, id"
    user_input = gets.chomp
    case user_input
    when user_input == "first_name"
    when user_input == "last_name"
    when user_input == "e_mail"
    when user_input == "id"
      puts "enter ID number:"
      id_num = gets.chomp
      self.find_id(id_num)
    end
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find_id(id_num)
    @@contacts.each do |x|
      if x.id == id_num
        puts "****************"
        puts "Id: " + x.id.to_s
        puts "First_name: " + x.first_name.to_s
        puts "Last_name: " + x.last_name.to_s
        puts "Email: " + x.email.to_s
        puts "Note: " + x.note.to_s
        puts "****************"
      end
    end
  end
  # def find_by_firstn(first_name)
  #   @@contacts.each do |x|
  #     if first_name == x.first_name


  # This method should delete all of the contacts
  def self.delete_all

  end

  def full_name

  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete

  end

  # Feel free to add other methods here, if you need them.

end
