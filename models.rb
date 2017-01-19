class User < ActiveRecord::Base
  has_many :posts # user.posts
  has_many :comments # user.comments
end

class Post < ActiveRecord::Base
  belongs_to :user # post.user
end

class Comment < ActiveRecord::Base
  belongs_to :user # comment.user
end


# Library app

# Relationship from Book to Author.

# Remove the author string column from book, and use a foreign key to an author table instead. (Rollback and migrate again after making changes OR look up the documentation for removing a column).

# Create a new reviews table, too. Reviews can be left for both books AND Authors.

# Create pages to view EACH Author and EACH book, and link a list the author's books to each individual book, and from the book page link back to the author page.
