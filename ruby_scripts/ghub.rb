url = %x{git config --get remote.origin.url}.gsub(".git", "")
if url[0..3] !=  "http"
  url = url.gsub("git@", "https://").gsub(".com:", ".com/")
end
%x{open #{url}}
