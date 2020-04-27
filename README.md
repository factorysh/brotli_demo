Brotli demo
===========

Serve static brotlified files, like a boss, without recompiling your Nginx.

Demo
----

On Mac:

    brew install brotli zopfli zstd

On Debian/Ubtuntu:

    apt-get install brotli zopfli zstd

Launch the demo:

    make

Enjoy the result:

    curl -v -H 'Accept-encoding: br' http://localhost:8000/
    curl -v -H 'Accept-encoding: gzip' http://localhost:8000/

[Firefox refuses brotli without TLS](https://bugzilla.mozilla.org/show_bug.cgi?id=1222541), it's boring. Chromium loves brotli.

Test
----

In a terminal :

    make

In another terminal :

    make test


Licence
-------

3 terms BSD licence. ©2020 Mathieu Lecarme.
