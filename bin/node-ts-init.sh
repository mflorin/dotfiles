#!/bin/sh
#
# {App} - {purpose, description}
#


src_dir="src"
build_dir="build"

echo "> installing npm-add-script ..."
npm install -g npm-add-script || exit 1

echo "> initialising npm project ..."
npm init -y || exit 1

echo "> installing typescript ..."
npm install --save-dev typescript || exit 1

echo "> installing node typings ..."
npm install --save-dev @types/node || exit 1

echo "> installing ts-node and nodemon ..."
npm install --save-dev ts-node nodemon || exit 1

# echo "> installing typescript-transform-paths ..."
# npm install --save-dev typescript-transform-paths || exit 1

echo "> installing mocha & chai ..."
npm install --save-dev mocha chai @types/mocha @types/chai || exit 1

echo "> installing eslint @typescript-eslint/eslint-plugin @typescript-eslint/parser ..."
npm install --save-dev eslint @typescript-eslint/eslint-plugin @typescript-eslint/parser || exit 1

echo "> installing husky & lint-staged ..."
npm install --save-dev husky lint-staged || exit 1

echo "> installing rimraf ..."
npm install --save-dev rimraf || exit 1

echo "> creating tsconfig.json ..."
npx tsc --init \
	--rootDir ${src_dir} \
	--outDir ${build_dir} \
	--esModuleInterop \
	--resolveJsonModule \
	--lib es6 \
	--module commonjs \
	--allowJs true \
	--noImplicitAny true || exit 1

echo "> creating tsconfig.prod.json"
cat > tsconfig.prod.json <<EOTSCONFIGPROD
{
  "extends": "./tsconfig.json",
  "exclude": ["src/**/*.test.ts"]
}
EOTSCONFIGPROD

echo "> creating .nodemonrc.json ..."
cat > .nodemonrc.json <<EONODEMON
{
  "watch": ["${src_dir}"],
  "ext": ".ts,.js",
  "ignore": [],
  "exec": "ts-node ./${src_dir}/index.ts"
}
EONODEMON

echo "> creating .mocharc.json ..."
cat > .mocharc.json <<EOMOCHA
{
  "require": ["ts-node/register"],
  "watch-files": ["./src/**/*.ts"]
}
EOMOCHA

echo "> creating .eslintrc.json ..."
cat > .eslintrc.json <<EOESLINT
{
  "env": {
    "node": true,
    "es2021": true
  },
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended"
  ],
  "parser": "@typescript-eslint/parser",
  "parserOptions": {
    "ecmaVersion": 12,
    "sourceType": "module"
  },
  "plugins": [
    "@typescript-eslint"
  ],
  "rules": {
    "comma-dangle": ["error", "always-multiline"],
    "indent": ["error", 2],
    "linebreak-style": ["error", "windows"],
    "quotes": ["error", "single"],
    "semi": ["error", "always"]
  }
}
EOESLINT

echo "> switching to MIT license ..."
json -I -f package.json -e "this.license = 'MIT'" 

echo "> adding husky config ..."
json -I -f package.json -e "this.husky = { hooks: { 'pre-commit': 'lint-staged', 'post-commit': 'git update-index --again' } }"

echo "> adding lint-staged config ..."
json -I -f package.json -e "this['lint-staged'] = { '*.ts': [ 'eslint --fix', 'git add' ] }"

echo "> adding package.json scripts ..."
npmAddScript -k "lint" -v "eslint src/**/*.ts --fix" || exit 1
npmAddScript -k "test" -v "mocha --config .mocharc.json --watch src/**/*.test.ts" -f || exit 1
npmAddScript -k "build" -v "rimraf ./${build_dir} && tsc --build tsconfig.prod.json" || exit 1
npmAddScript -k "start" -v "npm run start:dev" || exit 1
npmAddScript -k "start:dev" -v "nodemon --config .nodemonrc.json src/index.ts" || exit 1
npmAddScript -k "start:prod" -v "npm run build && node ${build_dir}/index.js" || exit 1

echo "> creating ${src_dir}/index.ts ..."
mkdir ${src_dir} && touch ${src_dir}/index.ts

echo "> creating .gitignore ..."

cat > .gitignore <<EOGITIGNORE
node_modules
${build_dir}
.idea
**/*.swp
EOGITIGNORE

echo "> setting up the git repo"
git init
git add .
git commit -a -m "initial commit"

echo
echo "ALL DONE, HAPPY CODING :)"
