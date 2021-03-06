# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sandi_metz = Author.create(name: 'Sandi', surname: 'Metz', slug: 'sandi-metz')
katrina_owen = Author.create(name: 'Katrina', surname: 'Owen', slug: 'katrina-owen')
sam_ruby = Author.create(name: 'Sam', surname: 'Ruby', slug: 'sam-ruby')
rob_isenberg = Author.create(name: 'Rob', surname: 'Isenberg',slug: 'rob-isenberg')
rob_isenberg.save

bottles_of_oop = Book.create(
    title: '99 Bottles of OOP',
    brief: 'a book for improve your ruby skill, of brilliant Katrina owen and Sandi Metz',
    slug: '99-bottles-of-oop')

agile_web_development_with_rails51 = Book.create(
    title: 'Agile web development with rails 5.1',
    brief: 'a classic book to start with rails, published for every major rails version...',
    slug: 'agile-web-development-with-rails-5-1:')

practical_object_oriented_design_in_ruby = Book.create(
    title: 'Practical object-oriented design in ruby',
    brief: 'Meticulously pragmatic and exquisitely articulate, POODiR make otherwise elusice knowledge available',
    slug: 'practical-object-oriented-design-in-ruby')

docker_for_rails_developer = Book.create(
    title: 'Docker for rails developer',
    brief: 'build, ship and run your application everywhere',
    slug: 'docker-for-rails-developers')

bottles_of_oop.authors << sandi_metz
bottles_of_oop.authors << katrina_owen
agile_web_development_with_rails51.authors << sam_ruby
practical_object_oriented_design_in_ruby.authors << sandi_metz
docker_for_rails_developer.authors << rob_isenberg

bottle_oop_comment_0 = Comment.create(
  book: bottles_of_oop,
  content: 'you can abstract a lyrics for this song without make a mess')
bottle_oop_comment_1 = Comment.create(
  book: bottles_of_oop,
  content: 'it sounds easy... why not')
bottle_oop_comment_2 = Comment.create(
  book: bottles_of_oop,
  content: 'ok, show me the code...')
