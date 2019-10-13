# Specifications for the Rails Assessment

Specs:

 x Using Ruby on Rails for the project
 x Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
   -List has_many :tasks
   -Task has_many :notes
   -User has_many :assignments
 x Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
   -Note belongs_to :task
   -Task belongs_to :list
 xInclude at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items   through Ingredients)
   -User has many tasks through assignments
   -List has many notes through tasks
 xInclude at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g.      Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
   -A user has_many tasks and a task has many users
 xThe "through" part of the has_many through includes at least one user submittable attribute, that is to   say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name   e.g. ingredients.quantity)
   -The join table (assignments) lets user submit a due date (as a string)
 xInclude reasonable validations for simple model objects (list of model objects with validations e.g.       User, Recipe, Ingredient, Item)
   -User model validates presence of password and the uniqueness of email address
 xInclude a class level ActiveRecord scope method (model object & class method name and URL to see the      working feature e.g. User.most_recipes URL: /users/most_recipes)
   -Task model has :completed and :incomplete scopes
 xInclude signup (how e.g. Devise)
   -Users can sign up either via the Liste app or through Facebook
 xInclude login (how e.g. Devise)
   --Users can login either via the Liste app or through Facebook
 xInclude logout (how e.g. Devise)
 xInclude third party signup/login (how e.g. Devise/OmniAuth)
  -Uses OmniAuth to allow Facebook signup/login
 xInclude nested resource show or index (URL e.g. users/2/recipes)
 xInclude nested resource "new" form (URL e.g. recipes/1/ingredients/new)
 xInclude form display of validation errors (form URL e.g. /recipes/new)
Confirm:

 The application is pretty DRY
 Limited logic in controllers
 xViews use helper methods if appropriate
 Views use partials if appropriate