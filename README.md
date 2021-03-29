# RPM Package Resource

Checks the version and downloads a specific RPM package from an RPM repository.

``` yaml
resource_types:

- name: rpm-package-resource
  type: registry-image
  source:
    repository: mmanciop/rpm-version-resource
    tag: latest

resources:

- name: my-happy-rpm-package
  type: rpm-package
  source:
    repository:
      url: https://blah.blah/agent/generic/x86_64
      key: https://blah.blah/key.gpg
      username: 'waldo'
      password: '123456'
    package: my-happy-package
    architecture: x86_64
```

## Source Configuration

* `repository.url`: *Required* URL of the RPM repository to search.
* `repository.key`: *Required* Key of the RPM repository for verification.
* `repository.username`: *Optional* Username for authentication against the repository.
* `repository.password`: *Optional* Password for authentication against the repository.
* `repository.gpg_check`: *Optional* Whether RPM should check the validity of the key provided via `repository.key`; default: `true`; this setting is ignored if `repository.key` is not set.
* `repository.sslverify`: *Optional* Whether RPM should check the validity of SSL certificate exposed by `repository.url` (if HTTPS); default: `true`.
* `package`: *Required* Name of the RPM package to check.
* `architecture`: *Required* Which architecture to look for.

## Resource behavior

### `check`

Retrieves and returns all or newer versions available of the package.

### `in`

Retrieves a specific version of the package.
The file is saved in the target directory, preserving the name of the package.
It also populates a `version` file, containing the package version.

### `out`

Not implemented.
This resource is read-only.

## Development

### Build Docker image

Run the following command in the root folder:

```sh
docker build -t mmanciop/rpm-package-resource .
```

### Public to Docker Hub

```sh
docker push mmanciop/rpm-package-resource:latest
```
