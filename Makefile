.PHONY: clean

cake 	= node_modules/.bin/cake

all		= index.html style.css app.js index.js

all: $(all)

index.html: index.pug
	$(cake) index.html

style.css: style.styl
	$(cake) style.css

app.js: app.coffee
	$(cake) app.js

index.js: index.coffee
	$(cake) index.js

clean:
	rm -f $(all)

