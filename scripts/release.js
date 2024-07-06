
import { execSync } from "child_process";
import fs from "fs";
import path from "path";

const bumpPatchVersion = (version) => {
  const [major, minor, patch] = version.split(".").map(Number);
  return `${major}.${minor}.${patch + 1}`;
};

const updateVersionAndCommit = (projectPath, projectName, tagPrefix) => {
  const packageJsonPath = path.join(projectPath, "package.json");
  const packageJson = JSON.parse(fs.readFileSync(packageJsonPath, "utf-8"));
  const newVersion = bumpPatchVersion(packageJson.version);
  packageJson.version = newVersion;
  fs.writeFileSync(packageJsonPath, JSON.stringify(packageJson, null, 2));
  execSync(`git add ${packageJsonPath}`);
  execSync(`git commit -m "chore(${projectName}): bump version to ${newVersion}"`);
  const tagName = `${tagPrefix}@${newVersion}`;
  execSync(`git tag ${tagName}`);
  console.log(`Bumped version of ${projectName} to ${newVersion} and created tag ${tagName}`);
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

  if (!(projectName in projectPaths)) {
    console.error(`Invalid project name: ${projectName}`);
    process.exit(1);
  }

  const projectPath = projectPaths[projectName];
  const tagPrefix = tagPrefixes[projectName];
  updateVersionAndCommit(projectPath, projectName, tagPrefix);
};

const args = process.argv.slice(2);
if (args.length !== 1) {
  console.error("Usage: node script.js <project-name>");
  process.exit(1);
}

main(args[0]);

