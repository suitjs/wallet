cmd /c jsdoc ./js/wallet.js -d docs/deploy/ -t docs/template/ -c docs/template/conf.json -r README.md
cmd /c uglifyjs js/wallet.js -o js/wallet.min.js
