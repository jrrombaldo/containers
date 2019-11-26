#HTTP-TEST
This is a containerisation of Gattling, the open source HTTP load test.
It comes with a simple pre-defined HTTP GET tests based on the following envrionment variables:

```shell script
docker run -it -rm \
  -e TARGET="https://exanple123.com" \
  -e DURATION="1 minutes" \
  -e CONTEXT_PATH="/" \
  -e REQ_SEC=20 \
  -e HEADER_UA="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0" \
  -e HEADER_ACCEPT="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" \
  -e HEADER_ENC="gzip, deflate" \
  -e HEADER_LANG="en-US,en;q=0.5" \
  -v <repor_dir>:/oputput\ \
  jrromb/http-test:latest
```

Or, for more advanced scenarios, other than a HTTP GET, create test using scala, and run it using this container as the following example:

```shell script
docker run -it -rm \
  -v <your_scala_script>:/opt/gatling/user-files/simulations/HTTPLoadGenerator.scala
  -v <repor_dir>:/oputput\
  jrromb/http-test:latest
```

On both cases, test execution summary will be the terminaal (stdin) and, once completed the full HTML report will be available on the specified report directory `<report_dir>`