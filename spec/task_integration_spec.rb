require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exception, false)
require 'pry'

describe('The lists path', {:type => :feature}) do
  it("displays a list of available lists on the index") do
    list = List.new({name: 'Farting', id: 1})
    list.save()
    visit('/')
    expect(page).to have_content(list.name())
  end
end

describe('The make a list path', {:type => :feature}) do
  it("allows user to make a new list") do
    visit('/')
    fill_in('user_list_input', :with => 'Take over the world')
    click_button("Let's do it!")
    expect(page).to have_content('Take over the world')
  end
end

describe('the tasks of a list path', {:type => :feature}) do
  it("displays thye tasks within a list") do
    list = List.new({name: 'Lots of Farting', id: 1})
    list.save()
    tasks = Task.new({description: 'on the sofa', list_id: 1})
    tasks.save()

    visit("/single_list/#{list.id()}")
    expect(page).to have_content('on the sofa')
  end
end

describe('the adding task to list path', {:type => :feature}) do
  it("allows user to add a task to a list") do
    list = List.new({name: 'Lots of Farting', id: 1})
    list.save()
    visit("/single_list/#{list.id()}")
    fill_in('user_task_input', :with => 'defeat France')
    click_button("I'll get around to this")
    expect(page).to have_content('defeat France')
  end
end



#as a user, I want to see a homepage with a list of lists
#as a user, i want to be able to add a list to my list of lists
#as a user, i want to be able to click into a list and see the tasks associated with that list
#as a user, i want to be able to add a task to a specific list.
