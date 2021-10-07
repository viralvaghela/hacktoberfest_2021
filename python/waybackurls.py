import requests
import sys
import json


def waybackurls(host, with_subs):
    if with_subs:
        url = 'http://web.archive.org/cdx/search/cdx?url=*.%s/*&output=json&fl=original&collapse=urlkey' % host
    else:
        url = 'http://web.archive.org/cdx/search/cdx?url=%s/*&output=json&fl=original&collapse=urlkey' % host
    r = requests.get(url)
    results = r.json()
    return results[1:]
    print(r)


if __name__ == '__main__':
    argc = len(sys.argv)
    if argc < 2:
        print('Usage:\n\tpython3 waybackurls.py <url> <include_subdomains:optional>')
        sys.exit()

    host = sys.argv[1]
    with_subs = False
    if argc > 3:
        with_subs = True

    urls = waybackurls(host, with_subs)

    json_urls = json.dumps(urls)
    if urls:
        filename = '%s-waybackurls.txt' % host
        with open(filename, 'w') as f:
            f.write(json_urls)
            
        print('[*] Saved results to %s' % filename)

        #To print line by line output
        f1=open(filename,"r+")
        input=f1.read()
        input=input.replace(',','\n')
        f2=open(filename,"w+")
        f2.write(input)
        f1.close()
        f2.close()    

    else:
        print('[-] Found nothing')
    



