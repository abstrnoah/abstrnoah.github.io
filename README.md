# serving locally with nix

The default flake app serves the site locally. In the repository root, just do

```sh
nix run
```

(Updating `Gemfile.lock` and `gemset.nix` is another story. Currently there's
some issue with Nix building the nokogiri gem and I don't care or know enough
about ruby to troubleshoot it. So just don't update these two files and you'll
be fine lol.)
