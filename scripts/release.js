import { execSync } from "child_process";
import { readFileSync, writeFileSync } from "fs";
import { join } from "path";

const bumpPatchVersion = (version) => {
  const [major, minor, patch] = version.split(".").map(Number);
  return `${major}.${minor}.${patch + 1}`;
};

const readJson = (filePath) => JSON.parse(readFileSync(filePath, "utf-8"));
const writeJson = (filePath, data) => writeFileSync(filePath, JSON.stringify(data, null, 2));

const executeGitCommands = (filePath, projectName, tagName) => {
  execSync(`git add ${filePath}`);
  execSync(`git commit -m "chore(${projectName}): bump version to ${tagName.split('@')[1]}"`);
  execSync(`git tag ${tagName}`);
  execSync(`git push --follow-tags`);
};

const updateVersionAndCommit = (projectPath, projectName, tagPrefix) => {
  const packageJsonPath = join(projectPath, "package.json");
  const packageJson = readJson(packageJsonPath);
  packageJson.version = bumpPatchVersion(packageJson.version);
  writeJson(packageJsonPath, packageJson);
  const tagName = `${tagPrefix}@${packageJson.version}`;
  executeGitCommands(packageJsonPath, projectName, tagName);
  console.log(`Bumped version of ${projectName} to ${packageJson.version}, created tag ${tagName}, and pushed to remote`);
};

const main = (projectName) => {
  const projectPaths = {
    lib: "packages/lib",
    cli: "packages/cli",
  };

  const tagPrefixes = {
    lib: "better-tmux",
    cli: "cli",
  };

  const projectPath = projectPaths[projectName];
  const tagPrefix = tagPrefixes[projectName];
  projectPath && tagPrefix ? updateVersionAndCommit(projectPath, projectName, tagPrefix) : console.error(`Invalid project name: ${projectName}`);
};

const [projectName] = process.argv.slice(2);
projectName ? main(projectName) : console.error("Usage: node script.js <project-name>");

