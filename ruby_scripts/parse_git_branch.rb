branch = %x{git rev-parse --abbrev-ref HEAD 2>/dev/null}
puts branch.strip == "HEAD" ? "(no branch)" : branch
