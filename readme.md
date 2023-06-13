Running tests locally
https://robotframework-browser.org/

Install nodejs After installing the requirement.txt

rfbrowser init

Test can be run locally
```
robot -d output -A Resources/env/demo.env test/login.robot

```

Run Positive Test cases with Positive tags:
```
robot -d output -A Resources/env/demo.env -i positive test/login.robot

```
Negative test cases:
```
robot -d output -A Resources/env/demo.env -i negative test/login.robot

```

It is also easier to run by using docker. Ensure docker is running and execute
```
docker build -t varian_test .

```

```
docker run --rm \
  --volume "$PWD":/home/robot \
  --network="host" \
  varian_test \
  bash -c "robot -d output -A Resources/env/demo.env test/login.robot"
```
