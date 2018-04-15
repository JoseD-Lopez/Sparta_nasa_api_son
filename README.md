# Sparta_nasa_api_son
service object model REST testing

#Objective

##was to use RSpec to test data with service object model SOM structure to test NASA api data regarding asteroids. This information can be found at https://api.nasa.gov/api.html#NeoWS

There are three different api sources providing different services:

Feed - which retrieves a list of Asteroids based on their closest approach date to Earth

Lookup - lookups up particular data on a specific Asteroid based on its NASA JPL small body (SPK-ID) ID

Browse - which allows us to browse the overall Asteroid data-set

#Files structure

 I set up the files according to each of the particular services calling particular data using the api and the key provided by nasa to retrieve the hashed information

For each of the services I then created the necessary Spec files t hold the tests for this again split the files according to the service provided

I linked spec file test to service by using a master class (service_master.rb) to create the link

Each spec file creates a new instance of the master class and then chain links to particular method that has an instance of service file that they want to connect to

After that is done the spec can then call on any of the methods in the particular_service.rb that it has created a link to and therefore test it
