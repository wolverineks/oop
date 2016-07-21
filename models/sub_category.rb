class SubCategory
  attr_accessor :count
  attr_reader :id, :name, :category_id

  @@sub_categories = []

  def initialize(args)
    @id        = args[:sub_category_id].to_i
    @name      = args[:sub_category_name]
    @category_id = args[:category_id].to_i
    @count     = 0
    @category
    @questions

    @@sub_categories << self
  end

  def category
    @category ||= Category.all.find { |category| category.id == category_id }
  end

  def questions
    @questions ||= Question.all.select { |question| question.sub_category_id == id }
  end

  def increment
    self.count += 1
  end

  def self.count
    @@sub_categories.count
  end

  def self.all
    @@sub_categories
  end
end
