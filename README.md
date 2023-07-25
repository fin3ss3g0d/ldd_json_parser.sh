# ldd_json_parser.sh

This script parses `domain_computers.json` and `domain_users.json` files produced by the tool `ldapdomaindump`. It extracts the DNS names of all computers and usernames of all users, printing the output to stdout.

## Dependencies

- jq
- sed
- grep
- tr

The script is written for Unix-like systems and requires the utilities listed above. The `jq` utility is used for parsing JSON, while `sed`, `grep`, and `tr` are used for text processing. Ensure these are installed before running the script.

## Usage

The script takes two arguments: the file path to parse and the target (users or computers).

```bash
./ldd_json_parser.sh /path/to/json/file users
./ldd_json_parser.sh /path/to/json/file computers
```

## Output

The output is a list of usernames or DNS names, depending on the target specified. This output can be piped to a file or processed further as needed.

For example, to save the output to a file:

```bash
./ldd_json_parser.sh /path/to/json/file users > userlist.txt
./ldd_json_parser.sh /path/to/json/file computers > dnslist.txt
```

## Errors

The script will exit with an error message if the file does not exist, no file path is provided, or an invalid target is provided. Valid targets are `users` and `computers`.