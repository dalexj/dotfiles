git_status = %x{git status 2> /dev/null}

if git_status =~ /nothing to commit/
  puts "Clean"
elsif !git_status
  puts "Not on repo"
else
  puts "Unclean"
end
