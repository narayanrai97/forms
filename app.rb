require 'sinatra'

set :bind, '0.0.0.0'

get '/' do
    "hello world"
end

#header = "<html><body>"
#footer = "</body></html>"   -- instead, we can use File.read as shown below
header = File.read("header.html")
footer = File.read("footer.html")
get '/submission' do
    #puts params.inspect
    #'<html><body><h1>Success</h1></body></html>'
    #2'success'
    #2"Hello " + params['email']

    left = params["left"].to_i
    right = params["right"].to_i
    #sum =left + right

    if params["operation"] == "+"
        result = left + right   # don't even need .to_s conversions

    elsif params["operation"] == "-"
        result = left - right
    elsif params["operation"] == "*"
        result = left * right
    else
        result = left.to_f/ right
    end

    #result= left.send(params["operation"], right)
    header + "<h1>Result: #{result}</h1>" + footer
end

get '/welcome' do
    header + "<h1>Welcome!!</h1>" + footer
end