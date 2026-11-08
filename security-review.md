# Security review

1. **PASS** — USER не root; `/data` передаётся во владение `node` до переключения пользователя. `Dockerfile:8,11`
2. **PASS** — порт привязан к `127.0.0.1:`. `compose.yaml:9`
3. **PASS** — инструкций `ENV`/`ARG` и Compose `environment` нет; файл секрета исключён из контекста сборки. `Dockerfile:1–12`; `compose.yaml:1–27`; `.dockerignore:1–4`
4. **FAIL / не подтверждено** — в готовом отчёте указано, что Scout не установлен и проверка не выполнена; подтверждения «0 критических» нет. `report/scout.txt:1` (Scout не запускался)
5. **PASS** — username и token берутся только из `secrets.NAME`. `.github/workflows/build.yml:21–22`

## Решения

1. Scout не проверен — принимаю: у меня Scout не стоит, поэтому пункт про критические уязвимости открыт; правок в файлах нет, перед следующим релизом сниму scout.txt.
2. Остальное — ок, проверил сам: Dockerfile (USER node, chown /data выше), compose.yaml (127.0.0.1 перед портом), .dockerignore (api_token.txt), build.yml (логин и токен из secrets).
