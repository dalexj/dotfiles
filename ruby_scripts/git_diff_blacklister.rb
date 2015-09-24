blacklist = File.read(".gitblacklist").split("\n")
files = %x{git diff --name-only}.split("\n")
puts files - blacklist
