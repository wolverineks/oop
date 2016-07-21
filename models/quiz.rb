class Quiz
  attr_reader :categories, :sub_categories, :questions, :num_of_questions, :question_ids, :questions

  def initialize(args)
    @categories            = args[:categories]
    @sub_categories        = args[:sub_categories]
    @num_of_questions      = args[:num_of_questions].to_i
    @questions             = []
    @question_ids          = []

    select_questions
  end

  def select_questions
    until question_ids.count >= num_of_questions
      question = select_question
      questions    << question
      question_ids << question.id
    end
  end

  def select_question
    category     = select_lowest_category_by_count(categories)
    sub_category = select_lowest_sub_category_by_count(category.sub_categories)
    question     = select_lowest_question_by_count(sub_category.questions)
  end

  def select_lowest_category_by_count(categories)
    category = categories.min_by { |category| category.count }
    category.increment
    category
  end

  def select_lowest_sub_category_by_count(sub_categories)
    sub_category = sub_categories.min_by { |sub_category| sub_category.count }
    sub_category.increment
    sub_category
  end

  def select_lowest_question_by_count(questions)
    question = questions.min_by { |question| question.count }
    question.increment
    question
  end

  def increment_category_count(category)
    category.count += 1
  end

end
