class Question
  attr_accessor :count
  attr_reader :id, :difficulty, :category_id, :category_name, :sub_category_id, :sub_category_name

  @@questions = []

  def initialize(args)
    @id            = args[:question_id].to_i

    @category_id     = args[:category_id].to_i
    @category_name   = args[:category_name]
    @sub_category_id   = args[:sub_category_id].to_i
    @sub_category_name = args[:sub_category_name]
    @difficulty    = args[:difficulty].to_f

    @count = 0
    @category
    @sub_category

    @@questions << self
  end

  def category
    @category ||= Category.all.find { |category| category.id == category_id }
  end

  def sub_category
    @sub_category ||= SubCategory.all.find { |sub_category| sub_category.id == sub_category_id }
  end

  def increment
    self.count += 1
  end

  def self.count
    @@questions.count
  end

  def self.all
    @@questions
  end
end
