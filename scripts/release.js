import { execSync } from "child_process";
import { readFileSync, writeFileSync } from "fs";
import { join } from "path";

const bumpPatchVersion = (version) => {
  const [major, minor, patch] = version.split(".").map(Number);
  return `${major}.${minor}.${patch + 1}`;
};

const readJson = (filePath) => JSON.parse(readFileSync(filePath, "utf-8"));
const writeJson = (filePath, data) => writeFileSync(filePath, JSON.stringify(data, null, 2));

const executeGitCommands = (filePath, tagName) => {
  execSync(`git add ${filePath}`);
  execSync(`git commit -m "chore: bump version to ${tagName}"`);
  execSync(`git tag ${tagName}`);
  execSync(`git push --follow-tags`);
};

const updateVersionAndCommit = (projectPath) => {
  const packageJsonPath = join(projectPath, "package.json");
  const packageJson = readJson(packageJsonPath);
  packageJson.version = bumpPatchVersion(packageJson.version);
  writeJson(packageJsonPath, packageJson);
  const tagName = `v${packageJson.version}`;
  executeGitCommands(packageJsonPath, tagName);
  console.log(`Bumped version to ${packageJson.version}, created tag ${tagName}, and pushed to remote`);
};

const main = () => {
  const projects = [
    { path: "packages/lib" },
    { path: "packages/cli" }
  ];

  projects.forEach(project => {
    updateVersionAndCommit(project.path);
  });
};

main()
