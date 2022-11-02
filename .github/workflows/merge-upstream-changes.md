# Merge Upstream Changes

```yml
on:
  schedule:
    - cron: "10 10 * * *" # This gives mirror sync, which runs at 9:57, some time to complete.
  workflow_dispatch: {}

permissions:
  contents: write
  pull-requests: write

jobs:
  merge-from-mirror:
    uses: mage-os/infrastructure/.github/workflows/merge-upstream-changes.yml@main
    with:
      upstream: https://github.com/mage-os/mirror-inventory.git
      matrix: '{ branch: ["develop"] }'
    secrets: 
      DISCORD_WEBHOOK: ${{ secrets.DISCORD_WEBHOOK }}
```