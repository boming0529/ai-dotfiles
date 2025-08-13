# AI Configurations

A centralized repository for my personal AI coding tool configurations. The goal is to streamline the setup process for new projects and environments, ensuring consistency and efficiency.

## Included Tools

This repository contains setup files for the following tools:

* **GitHub Copilot CLI**
    * `copilot/instructions.md`: A set of custom instructions used as context for `gh copilot suggest` and `gh copilot explain` to provide more tailored assistance.

* **Gemini CLI**
    * `gemini/GEMINI.md`: A default context file (pre-prompt) for the `gemini-cli` to give it a consistent starting point for conversations and tasks.

## How to Use

You can apply these configurations to your projects using one of the following methods.

### Method 1: Manual Setup

Simply copy the desired configuration files from this repository into your target project's directory.

* **For GitHub Copilot:**
    Copy `copilot/instructions.md` to `[your-project]/.github/copilot-instructions.md`.

* **For Gemini CLI:**
    Copy `gemini/GEMINI.md` to the location your `gemini-cli` is configured to read from (e.g., your project's root directory).

### Method 2: Automated Setup (Recommended)

Use the provided shell script to automatically deploy the files to a target project.

1.  **Clone this repository to your local machine:**
    ```bash
    git clone [https://github.com/YOUR_USERNAME/ai-configs.git](https://github.com/YOUR_USERNAME/ai-configs.git)
    cd ai-configs
    ```

2.  **Run the setup script**, passing the path to your target project as an argument:
    ```bash
    # Example: Deploying configs to a project located at ~/dev/my-new-app
    ./scripts/setup.sh ~/dev/my-new-app
    ```

The script will automatically create necessary directories and copy the files to their correct locations within your project.