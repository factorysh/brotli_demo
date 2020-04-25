
demo: build
	cd www \
		&& brotli -f *.html && brotli -f *.svg \
		&& gzip -kf *.html && gzip -kf *.svg
	docker run --rm \
		-v `pwd`/www:/var/www/html:ro \
		-p 8000:8000 \
		brotli

build:
	docker build -t brotli .
