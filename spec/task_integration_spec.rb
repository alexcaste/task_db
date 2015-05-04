require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)
require 'pry'

describe('The tasks path', {:type => :feature}) do
    # it('recieves input through forms, displays the input on the index') do
    #   visit('/')
    #   fill_in('task', :with => 'Wash the dog')
    #   click_button('Add task')
    #   click_link('Return to to do list.')
    #   expect(page).to have_content('Wash the dog')
    # end
    #
    # it('removes a task from the displayed list based on users description') do
    #   visit('/')
    #   fill_in('delete task', :with => 'Wash the dog')
    #   click_button('Delete task')
    #   click_link('Return to to do list.')
    #   expect(page).to have_no_content('Wash the dog')
    # end

end
