# PHP DevBox

The official DevBox php environment with popular linux tools on Alpine-Linux.

## Usage

All variants are avilable to pull from Docker hub, just replace `php` with the variant you need:

```bash
docker pull tdim/devbox:php
```

## Included Packages

All packages in core plus:

| **Name**     | **Description**                                                                              |
| ------------ | -------------------------------------------------------------------------------------------- |
| **PHP 8.3**  | The latest major version of the PHP programming language with new features and improvements. |
| **Apache2**  | A widely used web server software for hosting websites and applications.                     |
| **Composer** | A dependency manager for PHP that simplifies library and package management in PHP projects. |

Feel free to explore and utilize these tools in your development process! 🛠️✨

## PHP Extensions

| **Library/Extension** | **Description**                                                                                          |
| --------------------- | -------------------------------------------------------------------------------------------------------- |
| **apache2**           | Provides an interface for running PHP scripts in the Apache web server.                                  |
| **ctype**             | Functions for character class checking (e.g., checking if a character is a digit).                       |
| **curl**              | Library for making HTTP requests, allowing interaction with various APIs.                                |
| **gd**                | Graphics library for manipulating images (creating, altering, etc.).                                     |
| **iconv**             | Functions to convert data between different character encodings.                                         |
| **json**              | Functions for encoding and decoding JSON data, useful for API interactions.                              |
| **mbstring**          | Multibyte string functions for handling non-ASCII character encodings.                                   |
| **mysqli**            | Improved interface for MySQL database interactions (supports both procedural and object-oriented style). |
| **pdo_mysql**         | Provides a data-access abstraction layer for working with MySQL databases.                               |
| **pdo_sqlite**        | Provides a data-access abstraction layer for working with SQLite databases.                              |
| **session**           | Functions for managing user sessions to maintain state across requests.                                  |
| **sodium**            | Library for modern cryptography, providing secure encryption and hashing functions.                      |
| **sqlite3**           | Interface for interacting with SQLite databases.                                                         |
| **xml**               | Functions for working with XML data (parsing, manipulating, etc.).                                       |
| **zip**               | Functions for creating and managing ZIP archives.                                                        |

## DevContainer

- You can use the [official example here](https://github.com/Hima-Pro/devbox/blob/main/src/php/.devcontainer.json) it uses php entrypoint to start with fish shell.
