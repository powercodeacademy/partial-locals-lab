# Partials with Locals Lab

Now that we learned about locals, let's refactor our old codebase and add a
couple new features using this new tool.

## Objectives

1. Use the `locals` keyword
2. Understand why using instance variables in partials is discouraged in Rails 7.1+
3. Use a partial to iterate over a collection, passing in a local
4. Use a partial from another controller with a local

## Overview

So your team's lead engineer looked over the codebase and asked you to not refer
to instance variables in your partials but rather to pass through local
variables. That way, your code will be more explicit about its dependencies
when it calls the partial.

Also, the lead engineer asked for a couple new features.

The first is that we display _all_ students on the classroom show page instead
of singling out the oldest student with a special note. The engineer thinks
this isn't very polite.

Second, they also want to add some search functionality so that a user can
search for a student by name. They'll type the name in in a form field and
we'll use the power of ActiveRecord to find matching data. It's OK if other
students with similar names are returned in the search results.

## Instructions

1. Refactor the `_form.html.erb` partial to use the `form_with` helper. You'll also need to change the `new.html.erb` and `edit.html.erb` views as well.

2. Refactor the `_student.html.erb` partial to pass through each rendered
   student as a local.

3. On the classroom show page, iterate through each classroom's students and
   display each of them using our `_student.html.erb` partial with locals.

4. Create a `_classroom.html.erb` partial to display classroom information on
   the classroom show page.

5. Add in search functionality such that users can type in a student name or
   fragment of a student name and and see all matching results on the students
   index page. The results should be displayed by rendering a
   `students/_student.html.erb` partial.

To start on this last deliverable, add a search form using the `form_with` helper
to your students index page:

```erb
<%= form_with url: students_path, method: :get, local: true do |form| %>
   <p>
      <%= form.text_field :query, value: params[:query] %>
      <%= form.submit "Search" %>
   </p>
<% end %>
```

When this form is submitted, it will make a GET request to `/students`. The text
from the query will be available in the params hash. From here, you'll need to
use that query to find students using a "fuzzy" or "wildcard" search in the
controller in order to create the set of matches.

For the next step, you'll need to write a flexibly matching (or "wildcard")
query in ActiveRecord that follows the form:
`Student.where("name LIKE ?", "%query%")`. For example,
`Student.where("name LIKE ?", "%M%")` will return all students with an "M"
anywhere in their name. Remember, your query will come from the params hash.

Once you have the search functionality coded, you should be able to visually
test it by visiting `http://localhost:3000/students?query=search_text`.

## Resources

- [SQL LIKE Operator](https://www.w3schools.com/sql/sql_like.asp)
