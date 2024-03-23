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