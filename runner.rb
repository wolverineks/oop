# require_relative 'models/question'
# require_relative 'models/parser'
# require_relative 'models/quiz'
# require_relative 'models/category'
# require_relative 'models/sub_category'
Dir["models/*.rb"].each { |file| load(file) }

args = {
  categories_file: "data/categories.csv",
  sub_categories_file: "data/sub_categories.csv",
  questions_file: "data/questions.csv"
}

parser = Parser.new(args)

categories = parser.categories
sub_categories = parser.sub_categories
questions = parser.questions

num_of_questions = 0

until num_of_questions > 0
  puts "How many questions would you like to include in your quiz?"
  num_of_questions = gets.to_i
end

quiz = Quiz.new(
    categories: categories,
    sub_categories: sub_categories,
    num_of_questions: num_of_questions)

# # print to the screen the list of question id's
puts "#{quiz.question_ids}"
