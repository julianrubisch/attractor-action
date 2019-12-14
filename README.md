# attractor-github-action

```yml
name: Attractor

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Run Attractor
      uses: julianrubisch/attractor-action@master
      with:
        version: 'latest'
        bundle: 'false'
        file_prefix: 'app/models'
        javascript: 'true'
    - name: Upload Artifact
      uses: actions/upload-artifact@v1
      if: success()
      with:
        name: attractor
        path: attractor_output
```
