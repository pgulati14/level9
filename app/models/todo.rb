class Todo < ActiveRecord::Base
  belongs_to :user

  def to_pleasent_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{due_date.to_s} #{todo_text} #{is_completed}"
  end

  def due_today?
    due_date == Date.today
  end

  def self.completed
    all.where(completed: true)
  end
  def self.due_today
    all.where("due_date = ?", Date.today)
  end
  def self.overdue
    all.where("due_date < ? and (not completed)", Date.today)
    #all.where("due_date < ? and completed= ?", Date.today, false)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end


  def self.show_list
    puts "My Todo-List\n\n"
    puts "Overdue\n"
    puts overdue.show_list
    puts "\n\n"
    puts "Due Today\n"
    puts due_date.show_list
    puts "\n\n"
    puts "Overdue\n"
    puts due_later.show_list
    puts "\n\n"
  end
end
