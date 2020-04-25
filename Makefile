
demo: build
	cd www && brotli -f *.html && brotli -f *.svg
	docker run --rm \
		-v `pwd`/www:/var/www/html:ro \
		-v `pwd`/lua:/opt/brotli:ro \
		-p 8000:8000 \
		brotli

build:
	docker build -t brotli .
