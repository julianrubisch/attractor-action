# Attractor Action

## Table of Contents

  * [Usage](#usage)
  * [Example Workflow](#example-workflow)
  * [Inputs](#inputs)
  * [License](#license)

## Usage
Add the following to your GitHub action workflow to use Attractor Action:

```yml      
- name: Run Attractor
  uses: julianrubisch/attractor-action@master
  with:
    version: 'latest'
    bundle: 'false'
    (file_prefix: 'app/models') - OPTIONAL
    (javascript: '(true|false)') - OPTIONAL
```

## Example Workflow

```yml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
      with: 
        fetch-depth: '0'     # IMPORTANT!
    - name: Run Attractor
      uses: julianrubisch/attractor-action@master
      with:
        version: 'latest'
        bundle: 'false'
        (file_prefix: 'app/models') # OPTIONAL
        (javascript: '(true|false)') # OPTIONAL
    - name: Upload Artifact
      uses: actions/upload-artifact@v1
      if: success()
      with:
        name: attractor
        path: attractor_output
```

It's **compulsory** to set the `fetch-depth` attribute on the checkout action to `0`, otherwise only the `HEAD` commit will be fetched, rendering the `churn` output useless (we need the full history).

## Inputs

| **Input Parm Name** | **Required** | **Default Value** | **Description**                                                                                       | **Examples of Equivalent Local Commands**                                  |
| ------------------- | ------------ | ----------------- | ----------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| bundle              | false        | false             | If you would like to run `bundle install` on your project instead of `gem install`                    | `bundle install --deployment --jobs 4 --retry 3`                           |
| version             | false        | latest GA         | Define a different version of attractor                                              | `gem install attractor -v 1.0.0`                                            |
| file_prefix         | false        | ''                | Specify a director (defaults to app root) | `attractor report --file-prefix app/models` |
| javascript          | false        | false             | Set this to true if you would like to check javascript | `attractor report -t js` |

## License

MIT

## 
