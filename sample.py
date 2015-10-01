import urllib.request
with urllib.request.urlopen('http://httpbin.org/get') as response:
   html = response.read()
   print(html)
