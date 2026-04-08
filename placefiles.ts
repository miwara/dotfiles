interface ConfFiles {
  name: string;
  placeDir: string; // 配置場所
  src?: string; // 配置元のファイルパス。省略された場合はnameと同じとみなす
}

const HOME = Deno.env.get("HOME");

const confFiles: ConfFiles[] = [
  // emacs
  { name: "init.el", placeDir: `${HOME}/.emacs.d/`, src: "emacs/init.el" },
  { name: "custom.el", placeDir: `${HOME}/.emacs.d/`, src: "emacs/custom.el" },
  { name: "snippets", placeDir: `${HOME}/.emacs.d/`, src: "emacs/snippets" },
  // zsh
  { name: ".zshrc", placeDir: `${HOME}/` },
  // git
  {
    name: "ignore",
    placeDir: `${HOME}/.config/git/`,
    src: ".config/git/ignore",
  },
  // alacritty
  {
    name: "alacritty.toml",
    placeDir: `${HOME}/.config/alacritty/`,
    src: ".config/alacritty/alacritty.toml",
  },
  // tmux
  {
    name: "tmux.conf",
    placeDir: `${HOME}/.config/tmux/`,
    src: ".config/tmux/tmux.conf",
  },
  // ghostty (こっちをメインに使っている)
  {
    name: "config",
    placeDir: `${HOME}/.config/ghostty/`,
    src: ".config/ghostty/config",
  },
  // starship
  {
    name: "starship.toml",
    placeDir: `${HOME}/.config/`,
    src: ".config/starship/starship.toml",
  },
  // CLAUDE
  { name: "CLAUDE.md", placeDir: `${HOME}/.claude/`, src: ".claude/CLAUDE.md" },
  {
    name: "settings.json",
    placeDir: `${HOME}/.claude/`,
    src: ".claude/settings.json",
  },
  // CLAUDEのステータスラインに表示するコマンドの設定
  {
    name: "settings.json",
    placeDir: `${HOME}/.config/ccstatusline/`,
    src: ".config/ccstatusline/settings.json",
  },
];

const makePlaceDir = async (placeDir: string) => {
  await Deno.stat(placeDir).catch(async () => {
    await Deno.mkdir(placeDir, { recursive: true });
  });
};

const makeSymlink = async ({ name, placeDir, src }: ConfFiles) => {
  await Deno.lstat(placeDir + name).catch(async () => {
    await Deno.symlink(`${Deno.cwd()}/${src ?? name}`, placeDir + name);
  });
};

const placeFile = async (confFiles: ConfFiles[]) => {
  for (const confFile of confFiles) {
    await makePlaceDir(confFile.placeDir);
    await makeSymlink(confFile);
  }
};

placeFile(confFiles);
