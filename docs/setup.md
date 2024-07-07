[← Back](./README.md) / [Next →](./basic-usage.md)

# 1. Setup

## Installation

Install `better-tmux` CLI:
```sh
curl -sSL https://raw.githubusercontent.com/bettervim/better-tmux/main/scripts/install.sh | bash
```

The CLI contain only two commands / arguments:

- `--version`: Display the version installed
- `--file`: Specifies the file you'll use to customize your tmux

> 💡 Don't worry about this for now, we'll cover the basic usage later.

## Setting up your config
In the folder where you want to store your configuration (we recommend ~/), run the following command:
```sh
git clone https://github.com/bettervim/better-tmux-template.git ~/better-tmux && rm -rf better-tmux/.git
```
Now, install the dependencies using your favorite package manager:

```sh
pnpm install
# or bun install
# or yarn install
# or npm install
```

## Testing

To test changes in your configuration, you'll need to run the better-tmux CLI, specifying your configuration file. For example:
```sh
better-tmux ~/better-tmux/index.tsx
```

We recommend you to modify your `tmux.conf` to execute the CLI on every reload and point to the `index.tsx` of your config folder:
```sh
# ~/tmux.conf
run-shell 'better-tmux --file ~/better-tmux/index.tsx'
```

## Update
To update `better-tmux` CLI, run the following command
```sh
curl -sSL https://raw.githubusercontent.com/bettervim/better-tmux/main/scripts/update.sh | bash
```

<hr />

[← Back](./README.md) / [Next →](./basic-usage.md)
