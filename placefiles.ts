interface ConfFiles {
  name: string;
  placeDir: string;
}

const HOME = Deno.env.get("HOME");

const confFiles: ConfFiles[] = [
  { name: "init.el", placeDir: `${HOME}/.emacs.d/` },
  { name: "custom.el", placeDir: `${HOME}/.emacs.d/` },
  { name: "snippets", placeDir: `${HOME}/.emacs.d/` },
  { name: ".zshrc", placeDir: `${HOME}/` },
  { name: "ignore", placeDir: `${HOME}/.config/git/` },
  { name: "alacritty.toml", placeDir: `${HOME}/.config/alacritty/` },
  { name: "tmux.conf", placeDir: `${HOME}/.config/tmux/` },
];

const makePlaceDir = async (placeDir: string) => {
  await Deno.stat(placeDir).catch(async () => {
    await Deno.mkdir(placeDir, { recursive: true });
  });
};

const makeSymlink = async ({ name, placeDir }: ConfFiles) => {
  await Deno.lstat(placeDir + name).catch(async () => {
    await Deno.symlink(`${Deno.cwd()}/${name}`, placeDir + name);
  });
};

const placeFile = async (confFiles: ConfFiles[]) => {
  for (const confFile of confFiles) {
    await makePlaceDir(confFile.placeDir);
    await makeSymlink(confFile);
  }
};

placeFile(confFiles);
