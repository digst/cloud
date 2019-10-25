curl https://api.csswg.org/bikeshed/ -F file=@start.md -F force=1 > docs/start.html
#curl https://api.csswg.org/bikeshed/ -F file=@clarify.md -F force=1 > docs/clarify.html
curl https://api.csswg.org/bikeshed/ -F file=@stories.md -F force=1 > docs/stories.html
#curl https://api.csswg.org/bikeshed/ -F file=@intro.md -F force=1 > docs/intro.html
#bikeshed spec -f --print=plain spec.md spec.html
curl https://api.csswg.org/bikeshed/ -F file=@spec.md -F force=1 > spec.html
sed -f inline.sed spec.html > docs/spec.html
# Remember to inline SVG.


curl https://api.csswg.org/bikeshed/ -F file=@guide.md -F force=1 > docs/guide.html
