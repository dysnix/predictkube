# PredictKube Proto

This repository contains the Protocol Buffer (protobuf) definitions for the PredictKube project.

## Overview

PredictKube Proto defines the data structures and service interfaces used for communication between different components of the PredictKube system. It uses Protocol Buffers for efficient serialization and gRPC for service definitions.

## Project Structure

The project is organized as follows:

- `proto/`: Contains all the `.proto` files defining messages and services

  - `commonproto/`: Common message definitions
  - `enums/`: Enumeration definitions
  - `events/`: Event-related message definitions
  - `health/`: Health check protocol definitions
  - `services/`: Service interface definitions

- `external/`: Generated Go code from the protobuf definitions

## Key Components

1. **Auth Service**: Handles client management, cluster operations, and authentication
2. **Provider Service**: Manages metrics retrieval and raw query operations
3. **ML Engine Service**: Provides machine learning predictions
4. **Gateway Saver Service**: Handles metric storage and retrieval

## Development

### Prerequisites

- [Go](https://golang.org/dl/)
- [Protocol Compiler (protoc)](https://grpc.io/docs/protoc-installation/)
- [protoc-gen-go](https://grpc.io/docs/protoc-installation/)
- [protoc-gen-go-grpc](https://grpc.io/docs/protoc-installation/)

We use `.tool-versions` file to specify the versions of tools to use.
You can use either [mise-en-place](https://mise.jdx.dev)
or [asdf](https://asdf-vm.com/) to install the correct versions of tools.

### Generating Go Code

To generate Go code from the protobuf definitions, use the following command:

```shell
make gen-proto
```

This will generate the Go files in the `external/` directory.

### Adding Custom Tags

To add custom tags to the generated Go files, run:

```shell
make add-tags
```

This uses [protoc-go-inject-tag](https://github.com/favadi/protoc-go-inject-tag) to add custom tags to the generated structs.

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions to PredictKube Proto are welcome. Please ensure that you update the protobuf definitions and regenerate the Go code before submitting a pull request.

## Contact

For any questions or concerns, please open an issue in this repository.
