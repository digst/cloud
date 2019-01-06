curl https://api.csswg.org/bikeshed/ -F file=@intro.md -F force=1 > intro.html
# bikeshed spec -f --print=plain start.md start.html
#bikeshed spec -f --print=plain spec.md spec.html
curl https://api.csswg.org/bikeshed/ -F file=@spec.md -F force=1 > spec.html
#curl https://api.csswg.org/bikeshed/ -F file=@guide.md -F force=1 > guide.html


cp start.html intro.html spec.html guide.html  ./docs/
