{
  enable = true;
  userEmail = "harumaxy@gmail.com";
  userName = "harumaxy";
  lfs.enable = true;
  iniContent = {
    core.editor = "code --wait";
    push.autoSetupRemote = true;
    init.defaultBranch = "main";
  };
  ignores = [
    ".DS_Store"
    "node_modules"
  ];
}
