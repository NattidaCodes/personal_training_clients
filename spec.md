# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
       - Using Sinatra to build my app
- [x] Use ActiveRecord for storing information in a database
       - Using and Inherit from ActiveRecord::Base
- [x] Include more than one model class (e.g. User, Post, Category)
       - Has User model and Client model
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
       - has_many Clients
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
       - belongs_to User
- [x] Include user accounts with unique login attribute (username or email)
       - Users log in with username and password using password_digest
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
       - Client Model has full CRUD functionality
- [x] Ensure that users can't modify content created by other users
       - Restricted to edit, patch, and delete
- [x] Include user input validations
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
       - Validations for presence and uniqueness of username and password length
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message