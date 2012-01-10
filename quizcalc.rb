quiz = [0,0,0,1,0,0,1,1,0,1]


sentence = "The number of participants who did not attempt Quiz 1"
no_attempt = quiz.count(0)
total = quiz.count

puts "%s is %d out of %d total participants." % [sentence, no_attempt, total]