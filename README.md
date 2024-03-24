# Setup `dmtrctl` action

This is a Github action that sets up `dmtrctl` (Demeter's CLI) to be used by other steps of your workflow.

## Usage

To install latest release:

```yaml
steps:
- uses: actions/checkout@v2
- uses: demeter-run/setup-dmtrctl@v1
```

To pin the install to a particular release:

```yaml
steps:
- uses: actions/checkout@v2
- uses: demeter-run/setup-dmtrctl@v1
  with:
    version: '1.2.3'
```

## Releasing

> ::WARNING::
> Github needs the transpiled code with all dependencies as part of the git repo. 

1. run `npm run build`
2. make sure to commit `/lib` output
3. tag with new version
4. push to `main` branch