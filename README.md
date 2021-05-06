# simplescanrb
This tool looks for valid subdomains for the given domain using the httpclient library in ruby, then it shows you the list of subdomains found.


#### Requirements:

##### In order to run this program you should have the httpclient ruby library installed in your computer.
##### In case you need to install it you can do it using the following command:

```bash
gem install httpclient
```

#### Installation:
```bash
git clone https://github.com/gus3rmr/simplescanrb.git
cd /simplescanrb
chmod +x script.rb
```

#### Usage:

##### You will need to provide 2 arguments when executing the program: a domain and a subdomains dictionary in .txt format.

#### Example:
```bash
ruby script.rb tesla.com subdomains_dictionary.txt
```
