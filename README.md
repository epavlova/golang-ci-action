# golang-ci-action

GitHub action that puts in one place a few common CI steps for Go project.

***Please keep in mind that this GitHub action executes multiple steps and essentially is doing a few different things which may not be a good pattern.***
However it solves the problem of having common CI configuration for multiple projects in one single place.

### Usage

In order to use the action you should first checkout the project's source code.
```
    - name: Check out code into the Go module directory
      uses: actions/checkout@v1

    - name: Run the CI steps action
      uses: epavlova/golang-ci-action@master
      with:
        coverallsToken: ${{ secrets.COVERALLS_TOKEN }}
```

#### Input params

`coverallsToken` - Coveralls token needed to upload test results to Coveralls, required

`golangciVersion` - version of golangci runner to be used, not required with default value 'v1.18.0'

`golangciConfigVersion` - version of our golangci configuration file, not required with default value 'v1.0.0'
