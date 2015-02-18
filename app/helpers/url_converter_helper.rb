def convert_url(url)
  url_code = url.match(/v=([^&]+)/)
  p new_url = "https://www.youtube.com/embed/#{url_code[1]}"
end
