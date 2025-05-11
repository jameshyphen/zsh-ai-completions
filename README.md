# ZSH AI Completions

A ZSH plugin for AI-powered command completions.

## Installation

### Using Antigen

```zsh
antigen bundle aptula/zsh-ai-completions
```

### Using Oh My Zsh

1. Clone this repository into your custom plugins directory:
```zsh
git clone https://github.com/aptula/zsh-ai-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-ai-completions
```

2. Add the plugin to your `.zshrc`:
```zsh
plugins=(... zsh-ai-completions)
```

### Manual Installation

1. Clone this repository:
```zsh
git clone https://github.com/aptula/zsh-ai-completions
```

2. Add the following to your `.zshrc`:
```zsh
source /path/to/zsh-ai-completions/zsh-ai-completions.plugin.zsh
```

## Usage

The plugin will print a hello message when loaded. More functionality coming soon!

## License

MIT 