
demo: build compress
	docker run --rm \
		-v `pwd`/www:/var/www/html:ro \
		-p 8000:8000 \
		brotli

build:
	docker build -t brotli .

compress:
	cd www \
		&& brotli -f *.html && brotli -f *.svg \
		&& zopfli -f *.html && zopfli -f *.svg

clean:
	rm -f www/*.gz
	rm -f www/*.br
