# EACCESS error when running cspell in a docker container

This repository contains example code for Github issue [cspell 1510](https://github.com/streetsidesoftware/cspell/issues/1510).

This repository defines a Dockerfile with Node and cspell that has a keepAlive script, to enable it to be used with `docker-compose`. This allows a user start docker-compose and trigger a spellcheck with all the correct settings applied whenever they need it on whatever machine they have.

Using this repo:

```
$ docker-compose up -d
$ docker-compose exec --workdir /app/repository node npm run spellcheck
```

This should produce output like the following:

```
> cspell-eaccess-in-docker-container-issue@1.0.0 spellcheck
> cspell 'src/**/*.md'

Error: EACCES: permission denied, open '/root/.config/configstore/cspell.json'
You don't have access to this file.

    at Object.openSync (node:fs:582:3)
    at Object.readFileSync (node:fs:450:35)
    at Configstore.get all [as all] (/app/repository/node_modules/configstore/index.js:34:25)
    at Object.getRawGlobalSettings (/app/repository/node_modules/cspell-lib/dist/Settings/GlobalSettings.js:20:30)
    at Object.getGlobalSettings (/app/repository/node_modules/cspell-lib/dist/Settings/CSpellSettingsServer.js:465:45)
    at determineFinalDocumentSettings (/app/repository/node_modules/cspell-lib/dist/spellCheckFile.js:179:103)
    at spellCheckFullDocument (/app/repository/node_modules/cspell-lib/dist/spellCheckFile.js:116:25)
    at async processFile (/app/repository/node_modules/cspell/dist/lint.js:53:23)
    at async Object.measurePromise (/app/repository/node_modules/cspell/dist/util/timer.js:8:9)
    at async processFiles (/app/repository/node_modules/cspell/dist/lint.js:111:39) {
  errno: -13,
  syscall: 'open',
  code: 'EACCES',
  path: '/root/.config/configstore/cspell.json'
}
1/1 ./src/some.md 478.96ms X
/app/repository/src/some.md:3:17 - Unknown word (Haus)
CSpell: Files checked: 1, Issues found: 1 in 1 files
```
