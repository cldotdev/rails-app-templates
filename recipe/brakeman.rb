# Brakeman - Rails Security Scanner
# https://github.com/presidentbeef/brakeman
#
# Features:
# - Static code analysis for security vulnerabilities
# - Detects SQL injection, XSS, CSRF, and other issues
# - Generates HTML/JSON reports
# - CI/CD integration support
#
# Usage:
#   bundle exec brakeman
#   bundle exec brakeman -o report.html
#   bundle exec brakeman -f json -o report.json

gem "brakeman", group: :development, require: false
