# require_relative '../models/question'
# require_relative '../models/parser'
# require_relative '../models/quiz'
# require_relative '../models/category'
# require_relative '../models/sub_category'
# require_relative '../models/sub_category'
Dir["models/*.rb"].each { |file| load(file) }

args = {
  categories_file: "data/categories.csv",
  sub_categories_file: "data/sub_categories.csv",
  questions_file: "data/questions.csv"
}

parser = Parser.new(args)

categories   = parser.categories
sub_categories = parser.sub_categories
questions = parser.questions

num_of_questions = 12

quiz = Quiz.new(
    categories: categories,
    sub_categories: sub_categories,
    num_of_questions: num_of_questions)

puts "----- TESTING -----"
puts "quiz.question_ids"
expected = [1, 7, 3, 9, 4, 12, 2, 8, 3, 10, 5, 12]
actual = quiz.question_ids
puts "Expected: #{expected}"
puts "Actual:   #{actual}"
puts expected == actual ? "Pass" : "Fail"
