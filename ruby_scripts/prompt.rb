

def parse_git_branch
  branch = %x{git rev-parse --abbrev-ref HEAD 2>/dev/null}
  branch.strip == "HEAD" ? "(no branch)" : branch
end

def git_status_message
  git_status = %x{git status 2> /dev/null}

  if git_status =~ /nothing to commit/
    "Clean"
  elsif !git_status
    "Not on repo"
  else
    "Unclean"
  end
end

def prompt_segment(text, text_color = 7)
  bg_color = ENV["PROMPT_BG_COLOR"]
  "\e[4#{bg_color.strip}m\e[3#{text_color}m #{text.strip} \e[00m "
end


def build_mah_prompt
  prompt  = prompt_segment "\\@"
  prompt += prompt_segment "\\w"

  branch = parse_git_branch
  unless branch == ""
    prompt += prompt_segment " #{branch} ", ENV["PROMPT_TEXT_COLOR"]
    prompt += prompt_segment " #{git_status_message} ", ENV["PROMPT_TEXT_COLOR"]
  end

  prompt += "\n$ "

  print prompt
end

build_mah_prompt


# 0     1   2     3      4    5       6    7
# Black Red Green Yellow Blue Magenta Cyan White
