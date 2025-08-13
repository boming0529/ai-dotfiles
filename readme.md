# AI Configurations

A centralized repository for my personal AI coding tool configurations. The goal is to streamline the setup process for new projects and environments, ensuring consistency and efficiency.

## Included Tools

This repository contains setup files for the following tools:

* **GitHub Copilot CLI**
    * `copilot/instructions.md`: A set of custom instructions used as context for `gh copilot suggest` and `gh copilot explain` to provide more tailored assistance.

## How to Use

You can apply these configurations to your projects using one of the following methods.

### Method 1: Manual Setup

Simply copy the desired configuration files from this repository into your target project's directory.

* **For GitHub Copilot:**
    Copy `copilot/instructions.md` to `[your-project]/.github/copilot-instructions.md`.



The script will automatically create necessary directories and copy the files to their correct locations within your project.