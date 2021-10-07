# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# User.create(name: 'user', email: 'user@example.com', password: 'password', uid: 'user')
# PlayedPattern.create(code: 'code', user: User.first)
# correct_word = Word.create(name: 'correct')
# wrong_word = Word.create(name: 'wrong')
# PatternWord.create(played_pattern: PlayedPattern.first, is_correct: true, word: correct_word)
# PatternWord.create(played_pattern: PlayedPattern.first, is_correct: false, word: wrong_word)
# pattern1 = Pattern.create(code: 'pattern1')
# pattern2 = Pattern.create(code: 'pattern1')
i = 0
25.times do
  i += 1
  pattern = Pattern.all[i]
  j = 0
  10.times do
    user = User.all[j]
    j += 1
    Leaderboard.create(score: Random.rand(200), user_id: user.id, pattern_id: pattern.id)
  end
end
