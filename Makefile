
demo: build compress
	docker run --rm \
		-v `pwd`/www:/var/www/html:ro \
		-p 8000:8000 \
		brotli

build:
	docker build -t brotli .

www/zero-weight-dict:
	cd www && curl -O https://github.com/facebook/zstd/raw/dev/tests/dict-files/zero-weight-dict

compress: www/zero-weight-dict
	# You should train your own dict
	#  zstd --train *.{html,svg} -o my_dico
	cd www \
		&& brotli -f *.{html,svg} \
		&& zopfli -f *.{html,svg} \
		&& zstd -D zero-weight-dict -f -19 *.{html,svg}

clean:
	rm -f www/*.{gz,br,zst}
