.PHONY: clean

cake 	= node_modules/.bin/cake

all		= index.html style.css app.js index.js

all: $(all)

%.html: %.pug
	$(cake) $@

%.css: %.styl
	$(cake) $@

%.js: %.coffee
	$(cake) $@

clean:
	rm -f $(all)

