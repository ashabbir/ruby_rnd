def wrap_in_tag(tag, text)
  html = "<#{tag}>#{text}</#{tag}>"
  yield html
end


