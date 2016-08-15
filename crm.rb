require_relative 'contact'


class CRM

  def initialize(name)
    puts "This CRM is called" + name
  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then leave
    # Finish off the rest for 3 through 6
    # To be clear, the methods add_new_contact and modify_existing_contact
    # haven't been implemented yet
    # to exit abort("Message goes here")
    end
  end

  def leave
    abort("Thanks for using Awesome CRM, Goodbye!")
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts "do you know the contact by id? (yes/no)"
    answer1 = gets.chomp
    if answer1 == "yes"
      puts "please enter id number:"
      answer2 = gets.chomp.to_i
      puts "please enter which attribute would you like to change:"
      puts "first_name, last_name, email, note"
      con = Contact.find_id(answer2)
      answer3 = gets.chomp
      puts "what would you like to change it too?"
      answer4 = gets.chomp
      con.update(answer3, answer4)
      puts "Above contact has been updated!"
    else
      puts "please look up contact id."
      search_by_attribute
    end
  end

  def delete_contact
    puts "do you know the contact by id? (yes/no)"
    answer1 = gets.chomp
    if answer1 == "yes"
      puts "please enter id number:"
      answer2 = gets.chomp.to_i

      con = Contact.find_id(answer2)
      con.delete
      puts "Above contact has been deleted"
      puts ''
    else
      puts "please look up contact id."
      search_by_attribute
    end
  end

  # This method should accept as an argument an array of contacts
  # and display each contact in that array
  def display_contacts(array)
    array.each do |x|
    puts "****************"
    puts "Id: " + x.id.to_s
    puts "First_name: " + x.first_name.to_s
    puts "Last_name: " + x.last_name.to_s
    puts "Email: " + x.email.to_s
    puts "Note: " + x.note.to_s
    puts "****************"
  end

    # HINT: Make use of this method in the display_all_contacts and search_by_attribute methods to keep your code DRY
  end

  def display_all_contacts
    display_contacts(Contact.all)
    # HINT: Make use of the display_contacts method to keep your code DRY
  end

  def search_by_attribute
    puts "Enter what you like to search by: "
    puts "ex: first_name, last_name, e_mail, id"
    user_input = gets.chomp
    Contact.find_by(user_input)

    # HINT: Make use of the display_contacts method to keep your code DRY
  end

  # Add other methods here, if you need them.

end


awesome_crm_app = CRM.new("awesome")
awesome_crm_app.main_menu
