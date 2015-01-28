def parse_git_branch
  branch = %x{git rev-parse --abbrev-ref HEAD 2>/dev/null}
  branch.strip == "HEAD" ? "(no branch)" : branch
end

def prompt_segment(text, text_color = 7)
  "\e[45m\e[3#{text_color}m #{text.strip} \e[00m "
end


def build_mah_prompt
  prompt  = prompt_segment "\\@"
  prompt += prompt_segment "\\w"

  branch = parse_git_branch
  unless branch == ""
    prompt += prompt_segment " #{branch} ", 2
    prompt += prompt_segment " #{%x(ruby ~/.ruby_scripts/git_status_message.rb)} ", 2
  end

  prompt += "\n$ "

  print prompt
end

build_mah_prompt


# 0     1   2     3      4    5       6    7
# Black Red Green Yellow Blue Magenta Cyan White
