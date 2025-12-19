# Git Structure & Version Control Strategy — Day 5

## Purpose
Define a secure and professional Git workflow for cloud infrastructure projects.

## Git Scope Rule
Git must be initialized only inside the project directory.


## .gitignore as Security Layer
The following are excluded from Git:
- Terraform state files
- Logs
- Private keys
- OS-generated files

This prevents secret leakage and keeps the repository clean.

## Commit Strategy
- Small, meaningful commits
- Clear messages
- Infrastructure-first approach

Example:
Harden .gitignore and restrict Git scope to project

## Outcome
The repository follows industry-level Git hygiene
and is safe for public GitHub hosting.


