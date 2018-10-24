Feature: Delete vehicle 
	
	As an administrator
	In order to manage the vehicles we have
	I would like to delete vehicles to the database
	
	Background:
		Given the vehicle Car1 exist

	Scenario: Successfully delete vehicle
		Given I am on the vehicles page
		When I press "Delete"
		Then I should see "was successfully deleted"

    	