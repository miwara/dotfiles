interface ConfFiles {
  name: string;
  placeDir: string; // 配置場所
  src?: string; // 配置元のファイルパス。省略された場合はnameと同じとみなす
}

const HOME = Deno.env.get("HOME");

const confFiles: ConfFiles[] = [
  { name: "init.el", placeDir: `${HOME}/.emacs.d/`, src: "emacs/init.el" },
  { name: "custom.el", placeDir: `${HOME}/.emacs.d/`, src: "emacs/custom.el" },
  { name: "snippets", placeDir: `${HOME}/.emacs.d/`, src: "emacs/snippets" },
  { name: ".zshrc", placeDir: `${HOME}/` },
  {
    name: "ignore",
    placeDir: `${HOME}/.config/git/`,
    src: ".config/git/ignore",
  },
  {
    name: "alacritty.toml",
    placeDir: `${HOME}/.config/alacritty/`,
    src: ".config/alacritty/alacritty.toml",
  },
  {
    name: "tmux.conf",
    placeDir: `${HOME}/.config/tmux/`,
    src: ".config/tmux/tmux.conf",
  },
  {
    name: "config",
    placeDir: `${HOME}/.config/ghostty/`,
    src: ".config/ghostty/config",
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
