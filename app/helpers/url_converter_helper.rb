def convert_url(url)
  url_code = url.slice(/v=([^&]+)/)
  p new_url = "https://www.youtube.com/embed/#{url_code}"
end
