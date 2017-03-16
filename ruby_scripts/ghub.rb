commit = ARGV[0]
url = %x{git config --get remote.origin.url}.strip.gsub(".git", "")
if url[0..3] !=  "http"
  url = url.gsub("git@", "https://").gsub(".com:", ".com/")
end

if commit
  url = "#{url}/commit/#{commit}"
end

%x{open #{url}}
