import urllib.request
print("GET http://httpbin.org/get")
print("\n")
with urllib.request.urlopen('http://httpbin.org/get') as response:
   html = response.read()
   print(html)
