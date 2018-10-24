Feature: create vehicle 
	
	As an administrator
	In order to manage the vehicles we have
	I would like to create vehicles to the database
	
	Scenario: Successfully create vehicle
		Given I am on the create new vehicle page
		When I fill in "Name" with "Car1"
    	And I press "Create Vehicle"
    	#Then I should see "Car1 was successfully created."
    	Then I should see "Car1"