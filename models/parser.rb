require_relative 'category'
require_relative 'sub_category'
require_relative 'question'
require 'csv'

class Parser
  attr_accessor :file, :categories, :sub_categories, :questions

  def initialize(args)
    @categories = []
    @sub_categories = []
    @questions = []

    categories_file     = args[:categories_file]
    sub_categories_file = args[:sub_categories_file]
    questions_file      = args[:questions_file]

    parse_categories_from_file(categories_file)
    parse_sub_categories_from_file(sub_categories_file)
    parse_questions_from_file(questions_file)
  end

private

  def parse_categories_from_file(file)
    csv = CSV.readlines(file, :headers => true, :header_converters => :symbol)

    csv.each do |row|
      row = row.to_hash
      create_category(row)
    end
  end

  def parse_sub_categories_from_file(file)
    csv = CSV.readlines(file, :headers => true, :header_converters => :symbol)

    csv.each do |row|
      row = row.to_hash
      create_sub_category(row)
    end
  end

  def parse_questions_from_file(file)
    csv = CSV.readlines(file, :headers => true, :header_converters => :symbol)

    csv.each do |row|
      row = row.to_hash
      create_question(row)
    end
  end

  def create_category(row)
    categories << Category.new(row)
  end

  def create_sub_category(row)
    sub_categories << SubCategory.new(row)
  end

  def create_question(row)
    questions << Question.new(row)
  end
end
