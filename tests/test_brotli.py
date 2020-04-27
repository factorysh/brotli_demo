import brotli
import urllib3

http = urllib3.PoolManager()

def test_brotli():
    for url, t in {
        "http://localhost:8000/NASA_logo.svg": 'image/svg+xml',
        "http://localhost:8000/": 'text/html',
    }.items():
        for e in [None, 'br', 'gzip']:
            h = dict()
            if e is not None:
                h['accept-encoding'] = e
            r = http.request('GET', url, headers=h)
            assert r.status == 200
            if e is not None:
                assert r.headers['content-encoding'] == e
            else:
                assert 'content-encoding' not in r.headers
            assert r.headers['content-type'] == t

