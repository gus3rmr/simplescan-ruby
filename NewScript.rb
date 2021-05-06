require 'httpclient'


def subdomain_scan(domain, txt_file)

  puts ("Target domain: " + domain)

  discovered_subdomains = []
  new_urls = []
  lines = File.open(txt_file, "r").read().split("\n")

  lines.each do |line|
    new_urls.push("https://" + line + "." + domain + "/")
  end

  new_urls.each do |line2|
    begin
      client = HTTPClient.new
      method = 'GET'
      url = URI.parse line2
      res = client.request method, url
      puts ("[*] Subdomain found: " + line2 + " --> " + res.status.to_s)
      discovered_subdomains.push(line2)
    rescue SocketError, Errno::ECONNREFUSED, HTTPClient::ConnectTimeoutError, Errno::ENETUNREACH
      puts ("[*]Not found: " + line2)
    end
  end

  puts ("Discovered subdomains:")
  discovered_subdomains.each do |ds|
      puts ds
  end

end

if ARGV.length > 2
  puts "Too many arguments"
elsif ARGV.length < 2
  puts "There are missing arguments"
else
  domain = ARGV[0]
  txt_file = ARGV[1]
end

subdomain_scan(domain, txt_file)
