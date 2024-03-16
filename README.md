# Tiecd Github Action



## Inputs

The following inputs can be used as `step.with` keys:

| Name       | Type   | Default | Description                                                                   |
|------------|--------|---------|-------------------------------------------------------------------------------|
| `files`    | String |         | Server address of Docker registry. If not set then will default to Docker Hub |
| `username` | String |         | Username for authenticating to the Docker registry                            |
| `password` | String |         | Password or personal access token for authenticating the Docker registry      |
| `ecr`      | String | `auto`  | Specifies whether the given registry is ECR (`auto`, `true` or `false`)       |
| `logout`   | Bool   | `true`  | Log out from the Docker registry at the end of a job                          |


## Example usage

### Image Build

Using the Tiecd Jdk 11 iamge to build an application into an image.

```yaml
uses: actions/dataaxiom/tiecd-action@main
with:
  version: 'latest-jdk11'
  args: 'build image'
```

### Application Deployment

```yaml
uses: actions/dataaxiom/tiecd-action@main
with:
  version: 'latest-jdk11'
  args: 'deploy'
```
