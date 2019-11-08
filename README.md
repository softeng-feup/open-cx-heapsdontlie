# Commun.io
Passively Networking

## Business Modeling
### Vision
Our App aims to:

- provide one to one social media exchange
- allow the broadcast of social media information
- permit the filtering of incoming data based on defined preferences

It is directed towards:
    
- conference attendees seeking to expand their network
- recruiters looking for specialized people
- communities intending to broaden their audience
  
The atendees will benefit from maximizing their networking opportunities, as they will be equipped with the means to easily exchange their social media information.

Conferences, on the other hand, will profit from their now enhanced ability to form a densely connected community out of their audience, at a very small cost to themselves.

### Elevator Pitch
Ever felt like you lose contact with every awesome person you meet during a conference? Ever felt like
it is impossible for you to find the people whose interests are shared with you? Commun.io has a solution for you! Have the ability to find those close to you whom you can share your thoughts.
Commun.io - networking from the comfort of your pocket


## Requirements
### User stories
To check our current user stories, come to our [Trello](https://trello.com/b/Og2YbLLu/communio)!

### Use Case Diagram
<div align="center">
  <img width="865" src="assets/use-case.png">
</div>

### Domain Model
<div align="center">
  <img width="600" src="assets/domain-model.png">
</div>

### Acceptance Tests
The framework for automating the acceptance tests has not yet been implemented.
Therefore, the tests have been conceptualized, but not yet implemented.

#### Features
- Listing connections:
  - Given a list of two friends, with three registered social network links, then two friends will be displayed on the screen, with three different icons.
  - Given a list of three profiles, where two of them share their uuid, then two friends will be displayed, as profiles with the same unique id will be treated as being the same profile.
  - Given an empty list of friends, no cards will be displayed.
  - Given a list containing a profile with links to multiple profiles of the same social network, the different links will be display as separate icons of that social network.
  - Given a list containing a profile with two
    registered social networks and one unregistered,
    it will display the respective icons for the
    two registered social networks
    and a default icon for the other. 

- Searching For Nearby People:
  - Given a list of two people, both with interest in Big Data, and with no filters in the app, then it shall display those two people.
  - Given a list of two people, both with interest in Big Data, and with a filter on Big Data in the app, then it shall display those two people.
  - Given a list of two people, one with interest in Big Data and another with interest in AI, and with a single filter on AI, only the person with interest on AI will be displayed  
  - Given a list of two people, one with interest in Big Data and another with interest in AI, and with a filter on AI and another on Big Data, both people will be displayed
  
- Profile Page:
     - Given a user that is already logged in, then it is possible for him to choose his profile page and check all information regarding himself.
     - Given a user that is already logged in, when he's on his profile page, he can click on his interests text box and add a new one to the list
     - Given a user that is already logged in, when he's on his profile page, he can click on his skills text box and add a new one to the list
     - Given a user that is already logged in, when he's on his profile page, he can click on his programming languages text box and add a new one to the list
     - Given a user that is already logged in, then he can access his friends on listing connected and select one of them and see their profiles.
