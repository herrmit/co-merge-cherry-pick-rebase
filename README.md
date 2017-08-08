# Check out

I wanted to learn (some of) the details of git when merging, cherry-picking or rebasing. 

With the help of this Makefile I could easily switch to different test situations and analyze the outcome.

## How to use

Start with `make initial` to delete artefacts from former runs and initialize a git repo.

`make prep` creates a couple of commits including a branch "B". This is the starting point for different experiments.

From the starting point you can try one of the other make targets like, `make merge`, `make cherry-pick*`, etc.
