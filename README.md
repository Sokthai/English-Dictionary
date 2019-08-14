# English-Dictionary

### Statement
We will create an app to help non-native English speakers to improve their language skills. We are both non-native speakers and we are trying to make some of the tricks that helped us learn English more convinient, using our cs knowledge. 

### Analysis

We will use data abstraction to implement the game - keep track of the right answers, and accumulate the points from the user's right answers. 

We will use recursion (filter) to parse the received information.

We will use object-orientation to represent the users progress in the game, this will include state-modification.  


### External Technologies
We are using the Oxford Dictionary API to access their database.

### Data Sets or other Source Materials
We will receive from the Oxford Api, a database query and will parse the information using JSON (https://developer.oxforddictionaries.com/)

### Deliverable and Demonstration
At the completion of this project we will deliver a software that helps non-native English speakers improve their language skills. It will consists of two parts. First, we will create an interface that displays the definition of a word, requested by the user. In the second part we will use the user search history to create games that will allow the user to practice on their newly acquired vocabulary. 

### Evaluation of Results
We will feel that our project has been successful if we are able to integrate all three parts (GUI, API, data), and runs smothly. That means that a "non-technical" and with limited English language knowledge person can use it, and find it helpful. 

## Architecture Diagram
![alt_tag](https://github.com/oplS17projects/English-Dictionary/blob/master/diagram.png)

First we are going to create a gui interface to let user enter a word she/he wants to search. Then we will send a request the Oxford API. We will receive the the definition of the word, and parse it using it JSON. Then we will display the definition of the word in a gui interface, and save the user's search history. Lastly, we will use the user's search history to play games. 

## Schedule

### First Milestone (Sun Apr 9)
Joao: Get the GUI up and running (multiple windows, display)
Sokthai: Figure out RSound library.

### Second Milestone (Sun Apr 16)
Joao: Design the game
Sokthai: Store user's history

### Public Presentation (Mon Apr 24, Wed Apr 26, or Fri Apr 28 [your date to be determined later])
Integrate all three parts

## Group Responsibilities

### Sokthai Tang @sokthai 
Parse information, Rsound, search history

### Joao Almeida @joaoccanto
GUI, connect to API, design game

