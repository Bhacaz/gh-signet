module DashboardHelper
  def pull_request_ref(pull_request)
    pull_request_url = pull_request.pull_request.html_url
    elements = pull_request_url.split('/').last(4)
    elements[0] + '/' + elements[1] + '#' + elements[3]
  end
end
