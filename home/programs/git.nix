{
  enable = true;
  lfs.enable = true;
  settings = {
    user = {
      email = "harumaxy@gmail.com";
      name = "harumaxy";
    };
    core.editor = "$EDITOR --wait";
    push.autoSetupRemote = true;
    init.defaultBranch = "main";
  };
  ignores = [
    ".DS_Store"
    "node_modules"
    "*.local.*"
    "_my_files*"

  ];
}
