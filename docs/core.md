# Core DevBox

The official DevBox core environment with popular linux tools on Alpine-Linux.

## Usage

All variants are avilable to pull from Docker hub, just replace `latest` with the variant you need:

```bash
docker pull tdim/devbox:latest
```

## Included Packages

| Name      | Description                                                                     |
| --------- | ------------------------------------------------------------------------------- |
| btop      | Resource monitor that shows usage and stats of various system resources.        |
| curl      | Command-line tool for transferring data with URLs.                              |
| fish      | User-friendly command-line shell that offers improved scripting features.       |
| git       | Version control system for tracking changes in source code.                     |
| mc        | Midnight Commander, a visual file manager for navigating your system.           |
| nano      | Simple, easy-to-use text editor for command-line interface.                     |
| neofetch  | Command-line tool that displays system information in a visually appealing way. |
| net-tools | Collection of networking tools, including ifconfig, netstat, and more.          |
| nmap      | Network exploration tool and security/port scanner.                             |
| screen    | Terminal multiplexer that allows for multiple sessions in one terminal.         |
| xz        | Data compression tool using the LZMA algorithm.                                 |

Feel free to explore and utilize these tools in your development process! 🛠️✨

## DevContainer

- You can use the [official example here](https://github.com/Hima-Pro/devbox/blob/main/src/core/.devcontainer.json) it uses core entrypoint to start with fish shell.
