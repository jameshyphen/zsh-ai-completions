# ZSH AI Completions

A ZSH plugin that uses OpenAI's GPT to generate shell commands based on natural language input. Simply press CTRL+K and describe what you want to do, and the plugin will generate the appropriate command for you.


## Prerequisites

1. An OpenAI API key from [OpenAI Platform](https://platform.openai.com/api-keys)

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

1. **First-time Setup**:
   - Press CTRL+K
   - When prompted, enter your OpenAI API token
   - When prompted, enter your Operating system (e.g. Archlinux)

2. **Generating Commands**:
   - Press CTRL+K
   - Type your request in natural language (e.g., "find all PDF files in the current directory")
   - The plugin will generate and insert the appropriate command
   - Press ENTER to run

## Security

- Your OpenAI API token is stored in `~/.zsh-ai-completions.token`
- The token file has restricted permissions (600) to ensure only your user can read it
- The token is never exposed in your shell history
