alex = User.create(name: "Alex", email: "alex0701901@gmail.com", password: "password")
emily = User.create(name: "Emily", email: "emily901123@gmail.com", password: "password")

StudyPost.create(u_name: alex.name, user_id: alex.id, date: "9/11/2021", description: "Study CPA for 3 hrs", study_time: "50mins")

