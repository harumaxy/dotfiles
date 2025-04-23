pkgs: {
  enable = true;
  generateCompletions = true;
  interactiveShellInit = builtins.readFile ./interactiveShellInit.fish;
  functions = {
    "fish_user_key_bindings" = builtins.readFile ./fish_user_key_bindings.fish;
    # "fish_prompt" = builtins.readFile ./fish_prompt.fish;
    nbnew = ''
      nb add -f "$(date -Iminutes).$argv[1].md"
    '';
  };
  shellAliases = {
    ww = "wakeonlan 04:7C:16:4A:EB:C4";
    gs = "git status -s";
  };
  plugins = [
    {
      name = "plugin-peco";
      src = pkgs.fetchFromGitHub {
        owner = "oh-my-fish";
        repo = "plugin-peco";
        rev = "0a3282c9522c4e0102aaaa36f89645d17db78657";
        hash = "sha256-EUoicPd+aUMlfCeo9BOuIiBlQSpPtMtMn5AUkZU3uQA=";
      };
    }
    {
      name = "fish-ghq";
      src = pkgs.fetchFromGitHub {
        owner = "decors";
        repo = "fish-ghq";
        rev = "cafaaabe63c124bf0714f89ec715cfe9ece87fa2";
        hash = "sha256-6b1zmjtemNLNPx4qsXtm27AbtjwIZWkzJAo21/aVZzM=";
      };
    }
    {
      name = "plugin-git";
      src = pkgs.fetchFromGitHub {
        owner = "jhillyerd";
        repo = "plugin-git";
        rev = "d6950214b6b2392d3dbb2cb670f2a5f240090038";
        hash = "sha256-0uEKw+7EXkf5u3p3hfthSfQO/2rr3wl35ela7P2vB0Q=";
      };
    }
    {
      # VSCode 内蔵ターミナルだとバグるので以下の設定
      # "terminal.integrated.fontFamily": "'RobotoMono Nerd Font'"
      name = "theme-bobthefish";
      src = pkgs.fetchFromGitHub {
        owner = "oh-my-fish";
        repo = "theme-bobthefish";
        rev = "e3b4d4eafc23516e35f162686f08a42edf844e40";
        hash = "sha256-cXOYvdn74H4rkMWSC7G6bT4wa9d3/3vRnKed2ixRnuA=";
      };
    }
  ];
}
