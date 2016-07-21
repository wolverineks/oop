class Category
  attr_accessor :count
  attr_reader :id, :name, :sub_categories

  @@categories = []

  def initialize(args)
    @id        = args[:category_id].to_i
    @name      = args[:category_name]
    @count     = 0
    @sub_categories
    @questions

    @@categories << self
  end

  def sub_categories
    @sub_categories ||= SubCategory.all.select { |sub_category| sub_category.category_id == id }
  end

  def questions
    @questions ||= Question.all.select { |question| question.category_id == id }
  end

  def increment
    self.count += 1
  end

  def self.count
    @@categories.count
  end

  def self.all
    @@categories
  end
end
