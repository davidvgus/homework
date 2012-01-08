puts Dir.pwd
Dir.mkdir(Dir.pwd + '/tmp')
Dir.chdir(Dir.pwd + '/tmp')
Dir.pwd
Dir.chdir("..")
Dir.pwd
Dir.rmdir('./tmp')


