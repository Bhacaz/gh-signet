module DashboardHelper
  def pull_request_ref(pull_request)
    return '' unless pull_request.pull_request

    pull_request_url = pull_request.pull_request.html_url
    elements = pull_request_url.split('/').last(4)
    elements[0] + '/' + elements[1] + '#' + elements[3]
  end

  def text_color_contrast(hex_color)
    r = hex_color[1..2].to_i(16)
    g = hex_color[3..4].to_i(16)
    b = hex_color[5..6].to_i(16)
    yiq = ((r*299)+(g*587)+(b*114))/1000
    yiq >= 128 ? 'black' : 'white'
  end
end
