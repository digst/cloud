#curl https://api.csswg.org/bikeshed/ -F file=@intro.md -F force=1 > intro.html
bikeshed spec -f --print=plain start.md start.html
#curl https://api.csswg.org/bikeshed/ -F file=@spec.md -F force=1 > spec.html
#curl https://api.csswg.org/bikeshed/ -F file=@guide.md -F force=1 > guide.html
