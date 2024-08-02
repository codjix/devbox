# NodeJS DevBox

The official DevBox node environment with popular linux tools on Alpine-Linux.

## Usage

All variants are avilable to pull from Docker hub, just replace `node` with the variant you need:

```bash
docker pull tdim/devbox:node
```

## Included Packages

| **Name**      | **Description**                                                                                                      |
| ------------- | -------------------------------------------------------------------------------------------------------------------- |
| **node:21.7** | Version 22 of Node.js, a JavaScript runtime built on Chrome's V8 engine, used for building server-side applications. |
| **pnpm:9.5**  | A fast, disk space-efficient package manager for Node.js that uses symlinks to link packages.                        |
| **npm:10.8**  | The default package manager for Node.js, used to install and manage JavaScript packages.                             |

Feel free to explore and utilize these tools in your development process! 🛠️✨

## DevContainer

- You can use the [official example here](https://github.com/Hima-Pro/devbox/blob/main/src/node/.devcontainer.json) it uses node entrypoint to start with fish shell.
